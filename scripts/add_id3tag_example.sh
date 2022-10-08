ffmpeg -i ~/Desktop/なんちゃラジオ第248回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第248回「太宰府いったから受験しようか悩んでます」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="秋めいてきましたね" \
       ~/Desktop/248.mp3