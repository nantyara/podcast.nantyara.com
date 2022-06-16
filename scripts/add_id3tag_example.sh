ffmpeg -i ~/Desktop/なんちゃラジオ第232回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第232回「高ッケェ歯磨き粉を買いました」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="75ml で 2,400円するの" \
       ~/Desktop/232.mp3