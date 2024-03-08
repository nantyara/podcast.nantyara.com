ffmpeg -i ~/Desktop/なんちゃラジオ第322回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第322回「五苓散のおかげで二日酔わなかった気がする」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="目利きの銀次に来ております" \
        ~/Desktop/322.mp3
