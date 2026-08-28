ffmpeg -i ~/Desktop/なんちゃラジオ第451回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第451回「早起ききらい」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="なんちゃらアイドルのラジオ、それが、なんちゃラジオ" \
       ~/Desktop/451.mp3
