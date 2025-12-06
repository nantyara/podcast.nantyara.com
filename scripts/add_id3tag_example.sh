ffmpeg -i ~/Desktop/なんちゃラジオ第413回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第413回「都市伝説と自己開示」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ウォーターフロスはいいぞ" \
        ~/Desktop/413.mp3
