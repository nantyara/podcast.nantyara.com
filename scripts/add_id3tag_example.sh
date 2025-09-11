ffmpeg -i ~/Desktop/なんちゃラジオ第401回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第401回「おいでよ！さる小の3日間！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="それを言うならプロンプトですね" \
        ~/Desktop/401.mp3
