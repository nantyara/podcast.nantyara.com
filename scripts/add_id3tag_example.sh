ffmpeg -i ~/Desktop/なんちゃラジオ第391回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第391回「ブルベ夏 アンチ冬」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="許して下さい。あおはるです" \
        ~/Desktop/391.mp3
