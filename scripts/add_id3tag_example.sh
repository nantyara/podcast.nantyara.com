ffmpeg -i ~/Desktop/なんちゃラジオ第229回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第229回「ココ最近の遠征の思い出」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="真面目に聴いていますか" \
       ~/Desktop/229.mp3