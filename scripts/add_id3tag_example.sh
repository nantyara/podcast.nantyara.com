ffmpeg -i ~/Desktop/なんちゃラジオ第236回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第236回「ヴァイオレット・エヴァーガーデンを観た話」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="お休みなのよ横になっております" \
       ~/Desktop/236.mp3