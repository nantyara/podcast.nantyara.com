ffmpeg -i ~/Desktop/なんちゃラジオ第447回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第447回「夏をのりきろー」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="海行ってますか？プール行ってますか？" \
       ~/Desktop/447.mp3
