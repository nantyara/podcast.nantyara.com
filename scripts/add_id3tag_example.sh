ffmpeg -i ~/Desktop/なんちゃラジオ第387回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第387回「グッド・バイ(Good buy)」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="鼻がねぇ、詰まってて" \
        ~/Desktop/387.mp3
