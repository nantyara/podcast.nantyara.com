ffmpeg -i ~/Desktop/なんちゃラジオ第412回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第412回「いろんな街のオススメのお店」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="東京都北区赤羽です" \
        ~/Desktop/412.mp3
