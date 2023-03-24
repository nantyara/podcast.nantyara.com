ffmpeg -i ~/Desktop/なんちゃラジオ第272回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第272回「ワクワクワク休暇」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="大人だから、泣かないじゃないですか" \
       ~/Desktop/272.mp3
