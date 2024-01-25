ffmpeg -i ~/Desktop/なんちゃラジオ第316回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第316回「傷つかなくていいって話がしたかった」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="そろそろ１０周年" \
        ~/Desktop/316.mp3
