ffmpeg -i ~/Desktop/なんちゃラジオ第343回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第343回「ＱＯＬ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="２４時間の中で、どう過ごすか" \
        ~/Desktop/343.mp3
