ffmpeg -i ~/Desktop/なんちゃラジオ第318回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第318回「お祝いスペシャルウィーク！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="たくさんの人に、お世話になりまして" \
        ~/Desktop/318.mp3
