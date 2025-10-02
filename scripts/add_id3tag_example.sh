ffmpeg -i ~/Desktop/なんちゃラジオ第404回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第404回「ラブタイプ♡」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="さてさて、こ、今回も、はじめていきましょう" \
        ~/Desktop/404.mp3
