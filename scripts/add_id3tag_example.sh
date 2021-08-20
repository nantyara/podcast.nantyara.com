ffmpeg -i ~/Desktop/なんちゃラジオ第189回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第189回「エアコンの掃除をしました」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="体力を付ける運動をしているんですよ" \
       ~/Desktop/189.mp3