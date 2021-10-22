ffmpeg -i ~/Desktop/なんちゃラジオ第198回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第198回「読書の秋だ〜」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="秋っていうのはサ、ご飯が美味しくなるじゃないですか" \
       ~/Desktop/198.mp3