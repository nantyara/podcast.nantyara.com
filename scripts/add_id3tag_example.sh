ffmpeg -i ~/Desktop/なんちゃラジオ第253回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第253回「主催セブンデイズもうすぐ！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ここはね、私の部屋だから、好きなことを好きな風に話しますよ。どんなもんじゃい！" \
       ~/Desktop/253.mp3