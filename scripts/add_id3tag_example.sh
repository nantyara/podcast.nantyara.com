ffmpeg -i ~/Desktop/なんちゃラジオ第274回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第274回「ご指導ご鞭撻」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="新年度っていう単語が出てこなかった" \
       ~/Desktop/274.mp3
