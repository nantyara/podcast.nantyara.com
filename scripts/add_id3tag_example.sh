ffmpeg -i ~/Desktop/なんちゃラジオ第332回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第332回「記憶に結びついてる曲の話」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="直せない癖みたいなのがあって" \
        ~/Desktop/332.mp3
