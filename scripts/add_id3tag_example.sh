ffmpeg -i ~/Desktop/なんちゃラジオ第372回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第372回「忘れ物ってしたくないよね」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="La.mama の外楽屋回で〜す" \
        ~/Desktop/372.mp3
