ffmpeg -i ~/Desktop/なんちゃラジオ第227回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第227回「ラジオの企画をやってみる」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="みんなラジオで何を話してるんですかね" \
       ~/Desktop/227.mp3