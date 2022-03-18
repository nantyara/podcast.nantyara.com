ffmpeg -i ~/Desktop/なんちゃラジオ第219回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第219回「料理ってむじーーよな」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="オリジン弁当もコンビニフードも食べ尽くした" \
       ~/Desktop/219.mp3