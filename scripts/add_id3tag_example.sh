ffmpeg -i ~/Desktop/なんちゃラジオ第369回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第369回「誕生日だ！得がしたい！！！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="誕生日、クーポン届きまくるよね" \
        ~/Desktop/369.mp3
