require 'net/http'
require 'uri'
require 'yaml'

module VerifyAudioDelivery
  Expectation = Struct.new(:id, :audio_file_path, :audio_file_size, keyword_init: true)
  Result = Struct.new(:id, :audio_file_path, :ok, :reason, keyword_init: true)

  def self.expectations_from_posts(posts_glob)
    Dir.glob(posts_glob).sort.map do |path|
      front_matter = File.read(path, encoding: 'UTF-8').split(/^---\s*$/, 3)[1]
      data = YAML.safe_load(front_matter, permitted_classes: [Time])
      audio_file_path = data.fetch('audio_file_path')
      Expectation.new(
        id: File.basename(URI.parse(audio_file_path).path, '.mp3'),
        audio_file_path: audio_file_path,
        audio_file_size: data.fetch('audio_file_size')
      )
    end
  end

  def self.replace_host(url, host)
    return url unless host

    uri = URI.parse(url)
    uri.host = host
    uri.to_s
  end

  def self.verify_one(expectation, host: nil, http: Net::HTTP)
    url = replace_host(expectation.audio_file_path, host)
    uri = URI.parse(url)

    head_response = http.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |conn|
      conn.request(Net::HTTP::Head.new(uri))
    end

    unless head_response.code.to_i.between?(200, 299)
      return Result.new(id: expectation.id, audio_file_path: url, ok: false, reason: "HEAD #{head_response.code}")
    end

    content_length = head_response['content-length'].to_i
    if content_length != expectation.audio_file_size
      return Result.new(id: expectation.id, audio_file_path: url, ok: false,
                         reason: "content-length mismatch: expected #{expectation.audio_file_size}, got #{content_length}")
    end

    content_type = head_response['content-type']
    unless content_type&.start_with?('audio/')
      return Result.new(id: expectation.id, audio_file_path: url, ok: false, reason: "unexpected content-type: #{content_type}")
    end

    range_response = http.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |conn|
      request = Net::HTTP::Get.new(uri)
      request['Range'] = 'bytes=0-1'
      conn.request(request)
    end

    unless range_response.code == '206'
      return Result.new(id: expectation.id, audio_file_path: url, ok: false, reason: "range GET returned #{range_response.code}")
    end

    Result.new(id: expectation.id, audio_file_path: url, ok: true, reason: nil)
  end
end

if $PROGRAM_NAME == __FILE__
  require 'optparse'

  options = { posts_glob: File.expand_path('../_posts/*.md', __dir__), concurrency: 8, host: nil }
  OptionParser.new do |opts|
    opts.on('--posts-glob GLOB', 'glob for post files') { |v| options[:posts_glob] = v }
    opts.on('--host HOST', 'override the host part of audio_file_path (for testing against a different endpoint)') { |v| options[:host] = v }
    opts.on('--concurrency N', Integer, 'number of parallel HTTP checks') { |v| options[:concurrency] = v }
  end.parse!

  expectations = VerifyAudioDelivery.expectations_from_posts(options[:posts_glob])
  queue = Queue.new
  expectations.each { |e| queue << e }

  results = Queue.new
  workers = Array.new(options[:concurrency]) do
    Thread.new do
      loop do
        expectation = begin
          queue.pop(true)
        rescue ThreadError
          break
        end
        results << VerifyAudioDelivery.verify_one(expectation, host: options[:host])
      end
    end
  end
  workers.each(&:join)

  all_results = Array.new(results.size) { results.pop }
  failures = all_results.reject(&:ok)

  puts "total: #{all_results.size}, ok: #{all_results.size - failures.size}, failed: #{failures.size}"
  failures.each do |f|
    puts "  FAIL id=#{f.id} #{f.audio_file_path} — #{f.reason}"
  end

  exit(failures.empty? ? 0 : 1)
end
