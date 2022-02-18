ffmpeg -i ~/Desktop/なんちゃラジオ第215回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第215回「ピアノ買った！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="すぐに本題に入らせて頂きます" \
       ~/Desktop/215.mp3