ffmpeg -i ~/Desktop/なんちゃラジオ第422回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第422回「口腔内でドリルが超高速回転してるって冷静に考えて怖過ぎ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="気づいちゃいました" \
        ~/Desktop/422.mp3
