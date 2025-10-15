require 'mp3info'
require 'pathname'
require 'time'

# file_path '/path/to/001.mp3'
# publish_date '2018-09-28'
file_path, publish_date = ARGV
filename = Pathname.new(file_path).basename
publish_datetime = Time.parse("#{publish_date} 22:55:00 JST").rfc2822

File.open(file_path) do |f|
  Mp3Info.open(f) do |mp3|
    title, album, artist =  mp3.tag.values_at('title', 'album', 'artist')
    length = mp3.length
    desc = mp3.tag2.fetch('TIT3')
    num = filename.basename('.mp3')

    File.open("./_posts/#{publish_date}-#{num}.md", 'w') do |output_file|
      output_file.puts <<~TXT
        ---
        id: #{num}
        actor_ids:
          - mami
          - aoharu
        audio_file_path: https://files.nantyara.com/#{filename}
        audio_file_size: #{f.size}
        date: #{publish_datetime}
        description: #{desc}
        duration: #{length}
        layout: article
        title: #{title}
        ---
        ## 概要

        #{desc.each_line.map { |line| "#{line}" }.join}

        ## 関連リンク

        * none
      TXT
    end
  end
end
