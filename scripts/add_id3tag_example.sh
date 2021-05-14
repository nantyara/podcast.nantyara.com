ffmpeg -i ~/Desktop/なんちゃラジオ第175回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第175回「ラジオ第175回_母の日企画！心理テストやってみた！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="おなじみ、あおはる風呂回です" \
       ~/Desktop/175.mp3