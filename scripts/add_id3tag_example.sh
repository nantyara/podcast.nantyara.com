ffmpeg -i ~/Desktop/なんちゃラジオ第244回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第244回「そういや夏って怪談もあったね」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="夏と言えばなにかしら" \
       ~/Desktop/244.mp3