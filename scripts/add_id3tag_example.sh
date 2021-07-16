ffmpeg -i ~/Desktop/なんちゃラジオ第184回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第184回「モリのアサガオ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="今回は、死刑について考えていきたいと思います" \
       ~/Desktop/184.mp3