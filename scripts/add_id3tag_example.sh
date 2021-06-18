ffmpeg -i ~/Desktop/なんちゃラジオ第180回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第179回「オトナ帝国の逆襲を思い出す街に行きました」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="すごく雑談をね、してみちゃおっかな" \
       ~/Desktop/180.mp3