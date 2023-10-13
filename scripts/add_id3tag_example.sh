ffmpeg -i ~/Desktop/なんちゃラジオ第301回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第301回「韓国ライブ旅行記」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="２人でふりかえる韓国ライブ旅行記" \
       ~/Desktop/301.mp3
