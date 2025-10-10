ffmpeg -i ~/Desktop/なんちゃラジオ第405回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第405回「ガリガリくんのあたりをいつも期待している」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="今日、すんごい涼しかったわ" \
        ~/Desktop/405.mp3
