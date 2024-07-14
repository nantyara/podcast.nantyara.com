ffmpeg -i ~/Desktop/なんちゃラジオ第341回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第341回「はにゃほれひれはら」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="夏の暑さってこんなだったかぁ" \
        ~/Desktop/341.mp3
