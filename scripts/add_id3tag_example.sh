ffmpeg -i ~/Desktop/なんちゃラジオ第171回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第171回「みなさ〜ん許してますか！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="全然大丈夫なので安心して下さい" \
       ~/Desktop/171.mp3