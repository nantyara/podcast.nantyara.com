ffmpeg -i ~/Desktop/なんちゃラジオ第378回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第378回「エイプリルフールとの距離感」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="なんか嘘つきましたか？" \
        ~/Desktop/378.mp3
