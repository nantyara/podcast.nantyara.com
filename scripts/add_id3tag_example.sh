ffmpeg -i ~/Desktop/なんちゃラジオ第409回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第409回「干支1周て〜〜〜〜〜」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="タンミョン届いてる〜" \
        ~/Desktop/409.mp3
