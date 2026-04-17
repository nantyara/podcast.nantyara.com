ffmpeg -i ~/Desktop/なんちゃラジオ第432回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第432回「質感ラジオ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="1st ソロワンマンへご来場ありがとうございました" \
       ~/Desktop/432.mp3
