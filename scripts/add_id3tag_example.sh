ffmpeg -i ~/Desktop/なんちゃラジオ第438回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第438回「取り留めもなく話すときのオノマトペとは」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="色んな事があったんじゃあないですか？" \
       ~/Desktop/438.mp3