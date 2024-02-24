ffmpeg -i ~/Desktop/なんちゃラジオ第320回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第320回「安住紳一郎にくびったけです」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="木戸に立ちかけし衣食住" \
        ~/Desktop/320.mp3
