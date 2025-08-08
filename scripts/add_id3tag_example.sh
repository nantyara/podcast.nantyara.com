ffmpeg -i ~/Desktop/なんちゃラジオ第396回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第396回「狂気の5daysを終えて」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="帰り道に八百屋があるんですよ" \
        ~/Desktop/396.mp3
