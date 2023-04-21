ffmpeg -i ~/Desktop/なんちゃラジオ第276回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第276回「MV撮影したよ！！！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="いちばん理想的なクラウドファンディングとは" \
       ~/Desktop/276.mp3
