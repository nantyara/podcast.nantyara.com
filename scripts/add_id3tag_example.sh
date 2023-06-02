ffmpeg -i ~/Desktop/なんちゃラジオ第282回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第282回「ママはる友達多い」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="スタバに１日に２回も行ったんですよ" \
       ~/Desktop/282.mp3
