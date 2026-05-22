ffmpeg -i ~/Desktop/なんちゃラジオ第437回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第437回「してしまったミスとその反省」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="厚木じゃないよ厚着だよ" \
       ~/Desktop/437.mp3