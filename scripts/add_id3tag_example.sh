ffmpeg -i ~/Desktop/なんちゃラジオ第279回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第279回「GW！！！！！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="へいへいへいへいゴールデンウィークが終わりましたへい" \
       ~/Desktop/279.mp3
