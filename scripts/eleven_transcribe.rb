require 'json'
require 'net/http'
require 'yaml'

# ElevenLabs Scribe v2 で mp3 を文字起こしし、whisper-cli -otxt 互換（1発話1行）の txt を書く
module ElevenTranscribe
  class Error < StandardError; end

  STT_URI = URI('https://api.elevenlabs.io/v1/speech-to-text')
  MODEL = 'scribe_v2'
  RETRIES = 3
  TERMS_PATH = File.expand_path('../transcripts/terms.yml', __dir__)
  SENTENCE_END = /[。？！?!]\z/

  module_function

  def load_terms(path)
    data = YAML.safe_load_file(path) || {}
    { keyterms: data['keyterms'] || [],
      rules: (data['replace'] || []).map { [_1.fetch('from'), _1.fetch('to')] } }
  end

  def normalize(lines, rules)
    lines.map { |line| rules.reduce(line) { |l, (from, to)| l.gsub(from, to) } }
  end

  # keyterms は1語ずつ別フィールドで送る（JSON 配列だと invalid_keyword で弾かれる）
  def form_fields(keyterms:)
    [['model_id', MODEL], ['language_code', 'jpn'], ['diarize', 'false'],
     ['timestamps_granularity', 'word'], ['tag_audio_events', 'false']] +
      keyterms.map { ['keyterms', _1] }
  end

  def transcribe(mp3_path, api_key:, keyterms:, http: Net::HTTP, retry_wait: 10)
    RETRIES.times do |attempt|
      res = File.open(mp3_path, 'rb') do |f|
        req = Net::HTTP::Post.new(STT_URI, 'xi-api-key' => api_key)
        req.set_form(form_fields(keyterms: keyterms) +
                     [['file', f, { filename: File.basename(mp3_path), content_type: 'audio/mpeg' }]],
                     'multipart/form-data')
        http.start(STT_URI.host, STT_URI.port, use_ssl: true, read_timeout: 1800) { _1.request(req) }
      end
      return JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
      retryable = res.code == '429' || res.code.start_with?('5')
      raise Error, "ElevenLabs #{res.code}: #{res.body.to_s[0, 300]}" if !retryable || attempt == RETRIES - 1

      sleep retry_wait * (attempt + 1)
    end
  end

  def segments(words, gap: 0.8)
    segs = []
    cur = nil
    last_end = nil
    words.each do |w|
      next if w['type'] == 'audio_event'

      if w['type'] == 'spacing'
        cur << w['text'] if cur
        next
      end

      if cur && w['start'] - last_end > gap
        segs << cur
        cur = nil
      end
      (cur ||= +'') << w['text']
      last_end = w['end']

      if cur.match?(SENTENCE_END)
        segs << cur
        cur = nil
      end
    end
    segs << cur if cur
    segs.map(&:strip).reject(&:empty?)
  end
end

if $PROGRAM_NAME == __FILE__
  mp3_path, out_path = ARGV
  abort 'usage: ruby scripts/eleven_transcribe.rb <in.mp3> <out.txt>' unless mp3_path && out_path
  api_key = ENV['ELEVENLABS_API_KEY'] or abort 'ELEVENLABS_API_KEY が未設定'

  terms = ElevenTranscribe.load_terms(ElevenTranscribe::TERMS_PATH)
  body = ElevenTranscribe.transcribe(mp3_path, api_key: api_key, keyterms: terms[:keyterms])
  lines = ElevenTranscribe.normalize(ElevenTranscribe.segments(body.fetch('words')), terms[:rules])
  abort 'ElevenLabs の応答が空' if lines.empty?
  # 途中で落ちても不完全な txt を残さない（呼び出し側は txt の有無だけで生成済み判定する）
  tmp_path = "#{out_path}.#{Process.pid}.tmp"
  File.write(tmp_path, lines.join("\n") + "\n")
  File.rename(tmp_path, out_path)
end
