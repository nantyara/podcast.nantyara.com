ffmpeg -i ~/Desktop/なんちゃラジオ第365回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第365回「あけおめことよろ！に変わる言葉を探してみよう！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="新年あけおめスペシャル" \
        ~/Desktop/365.mp3
