ffmpeg -i ~/Desktop/なんちゃラジオ第445回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第445回「新潟旅行のはなし」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="メンタルヘルスマネジメントのスキルを使われたかも" \
       ~/Desktop/445.mp3
