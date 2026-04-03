ffmpeg -i ~/Desktop/なんちゃラジオ第430回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第430回「やるぞやるぞやるぞ〜！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="マチョマチョ、マチョマチョ" \
       ~/Desktop/430.mp3
