ffmpeg -i ~/Desktop/なんちゃラジオ第161回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第161回「楽器を弾いてみた」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="楽器を貰いまして、楽器というのは音が出る道具なんですけど" \
       ~/Desktop/161.mp3