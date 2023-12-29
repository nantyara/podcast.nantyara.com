ffmpeg -i ~/Desktop/なんちゃラジオ第312回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第312回「年の瀬も年の瀬」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="年末めいてまいりました〜" \
        ~/Desktop/312.mp3
