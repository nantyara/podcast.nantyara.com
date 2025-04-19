ffmpeg -i ~/Desktop/なんちゃラジオ第380回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第380回「関白宣言感想戦」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="春めいてきた気がしますね。世界が" \
        ~/Desktop/380.mp3
