ffmpeg -i ~/Desktop/なんちゃラジオ第355回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第355回「沖縄遠征楽しかったよ回」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="山羊おいしかったな" \
        ~/Desktop/355.mp3
