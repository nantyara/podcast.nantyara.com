ffmpeg -i ~/Desktop/なんちゃラジオ第165回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第165回「久々に質問に答えていきます」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="お風呂で質問に答えます。困った時の原点回帰です" \
       ~/Desktop/165.mp3