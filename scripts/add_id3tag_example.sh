ffmpeg -i ~/Desktop/なんちゃラジオ第222回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第222回「部屋を片付けたら起きれるようになった話」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ようやっと髪を染めまして" \
       ~/Desktop/222.mp3