ffmpeg -i ~/Desktop/なんちゃラジオ第375回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第375回「ランダムなテーマでトークしてみよう！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="さて、始まってはみたものの" \
        ~/Desktop/375.mp3
