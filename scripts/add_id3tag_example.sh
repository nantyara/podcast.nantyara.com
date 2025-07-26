ffmpeg -i ~/Desktop/なんちゃラジオ第394回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第394回「お江戸にトビマストビマス！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="なんか、咆哮をあげてしまいましたが" \
        ~/Desktop/394.mp3
