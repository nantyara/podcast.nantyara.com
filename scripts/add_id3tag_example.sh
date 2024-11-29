ffmpeg -i ~/Desktop/なんちゃラジオ第360回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第360回「酔っちゃった」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="冷蔵庫みたいな部屋より" \
        ~/Desktop/360.mp3
