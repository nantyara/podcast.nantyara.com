ffmpeg -i ~/Desktop/なんちゃラジオ第441回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第441回「塊魂は顔が浮腫む」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="塊魂が好きすぎる" \
       ~/Desktop/441.mp3
