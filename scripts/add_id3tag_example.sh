ffmpeg -i ~/Desktop/なんちゃラジオ第303回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第303回「東京タワーにのぼってきたよ！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="なんちゃらアイドルのあおはるがお送りしておりますわ。ってな" \
       ~/Desktop/303.mp3
