ffmpeg -i ~/Desktop/なんちゃラジオ第383回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第383回「オタマトーンやってみた」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="しゃべってるみたいでかわいいね" \
        ~/Desktop/383.mp3
