ffmpeg -i ~/Desktop/なんちゃラジオ第167回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第167回「おもちゃキーボードで遊んでみた」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ミニキーボード UK-01 を買いました" \
       ~/Desktop/167.mp3