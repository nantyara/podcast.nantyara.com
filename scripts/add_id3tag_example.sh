ffmpeg -i ~/Desktop/なんちゃラジオ第433回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第433回「大阪旅行談」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ゴロゴロ、ゴロゴロと転がり" \
       ~/Desktop/433.mp3