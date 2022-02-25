ffmpeg -i ~/Desktop/なんちゃラジオ第216回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第216回「ドライヤーの風圧にびっくりする」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ドライヤーって知ってますか？" \
       ~/Desktop/216.mp3