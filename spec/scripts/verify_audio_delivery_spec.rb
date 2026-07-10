require 'minitest/autorun'
require 'tmpdir'
require_relative '../../scripts/verify_audio_delivery'

class FakeConn
  def initialize(head_response:, range_response:)
    @head_response = head_response
    @range_response = range_response
  end

  def request(req)
    req.is_a?(Net::HTTP::Head) ? @head_response : @range_response
  end
end

class FakeHTTP
  def self.stub(head_response:, range_response:)
    conn = FakeConn.new(head_response: head_response, range_response: range_response)
    Class.new do
      define_singleton_method(:start) { |*_args, **_kwargs, &block| block.call(conn) }
    end
  end
end

FakeResponse = Struct.new(:code, :headers) do
  def [](key)
    headers[key]
  end
end

def fake_response(code:, headers: {})
  FakeResponse.new(code, headers)
end

describe VerifyAudioDelivery do
  let_expectation = VerifyAudioDelivery::Expectation.new(
    id: '001', audio_file_path: 'https://files.nantyara.com/001.mp3', audio_file_size: 100
  )

  it 'succeeds when content-length matches, content-type is audio, and range returns 206' do
    http = FakeHTTP.stub(
      head_response: fake_response(code: '200', headers: { 'content-length' => '100', 'content-type' => 'audio/mpeg' }),
      range_response: fake_response(code: '206')
    )
    result = VerifyAudioDelivery.verify_one(let_expectation, http: http)
    assert result.ok
  end

  it 'fails when content-length does not match' do
    http = FakeHTTP.stub(
      head_response: fake_response(code: '200', headers: { 'content-length' => '999', 'content-type' => 'audio/mpeg' }),
      range_response: fake_response(code: '206')
    )
    result = VerifyAudioDelivery.verify_one(let_expectation, http: http)
    refute result.ok
    assert_match(/content-length mismatch/, result.reason)
  end

  it 'fails when HEAD does not return success' do
    http = FakeHTTP.stub(
      head_response: fake_response(code: '404'),
      range_response: fake_response(code: '206')
    )
    result = VerifyAudioDelivery.verify_one(let_expectation, http: http)
    refute result.ok
    assert_match(/HEAD 404/, result.reason)
  end

  it 'fails when range request does not return 206' do
    http = FakeHTTP.stub(
      head_response: fake_response(code: '200', headers: { 'content-length' => '100', 'content-type' => 'audio/mpeg' }),
      range_response: fake_response(code: '200')
    )
    result = VerifyAudioDelivery.verify_one(let_expectation, http: http)
    refute result.ok
    assert_match(/range GET returned 200/, result.reason)
  end

  it 'replaces the host for testing against a different endpoint' do
    assert_equal 'https://r2.example.com/001.mp3', VerifyAudioDelivery.replace_host('https://files.nantyara.com/001.mp3', 'r2.example.com')
  end

  it 'leaves the url untouched when no host override is given' do
    assert_equal 'https://files.nantyara.com/001.mp3', VerifyAudioDelivery.replace_host('https://files.nantyara.com/001.mp3', nil)
  end
end

describe 'VerifyAudioDelivery.expectations_from_posts' do
  it 'parses id, audio_file_path, and audio_file_size from post front matter' do
    Dir.mktmpdir do |dir|
      File.write(File.join(dir, '001.md'), <<~POST)
        ---
        id: 001
        audio_file_path: https://files.nantyara.com/001.mp3
        audio_file_size: 19490727
        title: episode 1
        ---
        body
      POST

      expectations = VerifyAudioDelivery.expectations_from_posts(File.join(dir, '*.md'))
      assert_equal 1, expectations.size
      assert_equal '001', expectations.first.id
      assert_equal 'https://files.nantyara.com/001.mp3', expectations.first.audio_file_path
      assert_equal 19490727, expectations.first.audio_file_size
    end
  end
end
