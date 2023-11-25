ffmpeg -i ~/Desktop/なんちゃラジオ第307回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第307回「急ぎ気味近況ラジオ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="七日間戦争の最中からお送りします" \
        ~/Desktop/307.mp3
