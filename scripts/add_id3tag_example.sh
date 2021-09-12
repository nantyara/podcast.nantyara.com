ffmpeg -i ~/Desktop/なんちゃラジオ第192回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第192回「リングにお砂糖とスパイスと流血」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="今回は『赤×ピンク』の話してます" \
       ~/Desktop/192.mp3