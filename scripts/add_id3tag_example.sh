ffmpeg -i ~/Desktop/なんちゃラジオ第362回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第362回「味園ユニバースに立ったあとには」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="おめでとう、ありがとう、感無量" \
        ~/Desktop/362.mp3
