ffmpeg -i ~/Desktop/なんちゃラジオ第376回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第376回「ラジオメモとっててよかった〜」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="記憶にないメモがあったときの顔してる" \
        ~/Desktop/376.mp3
