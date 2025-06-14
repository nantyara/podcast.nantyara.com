ffmpeg -i ~/Desktop/なんちゃラジオ第388回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第388回「人生の常識とビジネス横文字知らないマン」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="そろそろ夏至です" \
        ~/Desktop/388.mp3
