ffmpeg -i ~/Desktop/なんちゃラジオ第176回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第176回「パイの実みたいなデニッシュ食べてみた」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="案件ではないです" \
       ~/Desktop/176.mp3