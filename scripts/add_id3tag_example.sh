ffmpeg -i ~/Desktop/なんちゃラジオ第440回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第440回「7.8.9.1.2.3」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ナイトガード忘れるとそうなる" \
       ~/Desktop/440.mp3
