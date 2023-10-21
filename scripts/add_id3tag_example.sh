ffmpeg -i ~/Desktop/なんちゃラジオ第302回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第302回「帰国後の話（初めて帰国した）」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="韓国から帰ってきて、色々ライブあった" \
       ~/Desktop/302.mp3
