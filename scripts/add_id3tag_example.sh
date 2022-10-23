ffmpeg -i ~/Desktop/なんちゃラジオ第250回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第250回「スポーツの秋と心の筋肉痛」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="秋めいてまいりましたね" \
       ~/Desktop/250.mp3