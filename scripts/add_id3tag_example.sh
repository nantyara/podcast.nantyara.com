ffmpeg -i ~/Desktop/なんちゃラジオ第370回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第370回「わたし誕生日って好きなんだよな〜」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="流れてんだろうなぁ、きっと（流れてます）" \
        ~/Desktop/370.mp3
