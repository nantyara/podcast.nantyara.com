require 'minitest/autorun'
require 'json'
require 'tmpdir'
require_relative '../../scripts/eleven_transcribe'

FakeSTTResponse = Struct.new(:code, :body) do
  def is_a?(klass)
    klass == Net::HTTPSuccess ? code.start_with?('2') : super
  end
end

class FakeSTTHTTP
  attr_reader :requests

  def initialize(*responses)
    @responses = responses
    @requests = []
  end

  def start(_host, _port, **_opts)
    yield self
  end

  def request(req)
    @requests << req
    @responses.shift
  end
end

def word(text, start, finish)
  { 'type' => 'word', 'text' => text, 'start' => start, 'end' => finish }
end

describe ElevenTranscribe do
  describe '.segments' do
    it 'splits on sentence-ending punctuation' do
      words = [word('こんにちは。', 0.0, 0.5), word('元気', 0.6, 0.9), word('？', 0.9, 1.0)]
      _(ElevenTranscribe.segments(words)).must_equal %w[こんにちは。 元気？]
    end

    it 'splits on long pauses even without punctuation' do
      words = [word('はい', 0.0, 0.3), word('そう', 2.0, 2.3)]
      _(ElevenTranscribe.segments(words)).must_equal %w[はい そう]
    end

    it 'keeps spacing inside a segment and drops audio events' do
      words = [word('Hello', 0.0, 0.3), { 'type' => 'spacing', 'text' => ' ' },
               { 'type' => 'audio_event', 'text' => '(笑)', 'start' => 0.3, 'end' => 0.4 },
               word('world', 0.4, 0.7)]
      _(ElevenTranscribe.segments(words)).must_equal ['Hello world']
    end
  end

  describe '.load_terms' do
    it 'reads keyterms and replace rules from yaml' do
      path = File.join(Dir.mktmpdir, 'terms.yml')
      File.write(path, <<~YAML)
        keyterms:
          - なんちゃラジオ
        replace:
          - from: なんちゃらジオ
            to: なんちゃラジオ
      YAML
      terms = ElevenTranscribe.load_terms(path)
      _(terms[:keyterms]).must_equal %w[なんちゃラジオ]
      _(terms[:rules]).must_equal [%w[なんちゃらジオ なんちゃラジオ]]
    end

    it 'treats missing sections as empty' do
      path = File.join(Dir.mktmpdir, 'terms.yml')
      File.write(path, "keyterms:\n  - A\n")
      _(ElevenTranscribe.load_terms(path)[:rules]).must_equal []
    end
  end

  describe '.normalize' do
    it 'applies every replace rule to each line' do
      rules = [%w[なんちゃらジオ なんちゃラジオ]]
      _(ElevenTranscribe.normalize(['なんちゃらジオ 第452回。', 'はい。'], rules))
        .must_equal ['なんちゃラジオ 第452回。', 'はい。']
    end
  end

  it 'ships a terms.yml whose keyterms include the hosts' do
    terms = ElevenTranscribe.load_terms(ElevenTranscribe::TERMS_PATH)
    _(terms[:keyterms]).must_include '御茶海マミ'
    _(terms[:keyterms]).must_include 'Ｑ太郎'
  end

  describe '.transcribe' do
    let(:mp3) do
      path = File.join(Dir.mktmpdir, '453.mp3')
      File.binwrite(path, 'ID3')
      path
    end

    it 'posts scribe_v2 multipart with keyterms and returns the parsed body' do
      http = FakeSTTHTTP.new(FakeSTTResponse.new('200', { 'words' => [] }.to_json))
      result = ElevenTranscribe.transcribe(mp3, api_key: 'k', http: http, keyterms: %w[なんちゃラジオ])

      _(result).must_equal({ 'words' => [] })
      req = http.requests.first
      _(req['xi-api-key']).must_equal 'k'
      _(req.path).must_equal '/v1/speech-to-text'
    end

    it 'sends each keyterm as its own field' do
      fields = ElevenTranscribe.form_fields(keyterms: %w[A B])
      _(fields).must_include ['model_id', 'scribe_v2']
      _(fields.count { _1.first == 'keyterms' }).must_equal 2
    end

    it 'retries on 429 then succeeds' do
      http = FakeSTTHTTP.new(FakeSTTResponse.new('429', 'slow down'),
                             FakeSTTResponse.new('200', { 'words' => [] }.to_json))
      ElevenTranscribe.transcribe(mp3, api_key: 'k', http: http, keyterms: [], retry_wait: 0)
      _(http.requests.size).must_equal 2
    end

    it 'gives up after the last retryable failure' do
      http = FakeSTTHTTP.new(*Array.new(3) { FakeSTTResponse.new('503', 'busy') })
      _ { ElevenTranscribe.transcribe(mp3, api_key: 'k', http: http, keyterms: [], retry_wait: 0) }
        .must_raise ElevenTranscribe::Error
      _(http.requests.size).must_equal 3
    end

    it 'raises immediately on 4xx other than 429' do
      http = FakeSTTHTTP.new(FakeSTTResponse.new('401', 'bad key'))
      _ { ElevenTranscribe.transcribe(mp3, api_key: 'k', http: http, keyterms: [], retry_wait: 0) }
        .must_raise ElevenTranscribe::Error
      _(http.requests.size).must_equal 1
    end
  end
end
