ffmpeg -i ~/Desktop/なんちゃラジオ第342回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第342回「今回のラジオには台本があります。」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="今回は構成作家がいる『なんちゃラジオ』です" \
        ~/Desktop/342.mp3
