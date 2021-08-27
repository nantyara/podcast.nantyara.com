ffmpeg -i ~/Desktop/なんちゃラジオ第190回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第190回「なくなった店の名前をぼくたちはもう知らない」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="『残像に口紅を』について話します" \
       ~/Desktop/190.mp3