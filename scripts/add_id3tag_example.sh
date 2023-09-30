ffmpeg -i ~/Desktop/なんちゃラジオ第299回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第299回「食べログ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="1000回、2000回、3000回と目指していきたいですね" \
       ~/Desktop/299.mp3
