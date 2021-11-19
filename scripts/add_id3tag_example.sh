ffmpeg -i ~/Desktop/なんちゃラジオ第202回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第202回「使ってるスマホアプリ紹介してみる」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="はせ参じた次第でございます" \
       ~/Desktop/202.mp3