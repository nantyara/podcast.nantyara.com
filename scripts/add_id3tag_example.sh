ffmpeg -i ~/Desktop/なんちゃラジオ第416回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第416回「今年も大変お世話になりました！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="福岡ありがとうございましたっ" \
        ~/Desktop/416.mp3
