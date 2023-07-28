ffmpeg -i ~/Desktop/なんちゃラジオ第290回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第290回「MBTIってなんだ？」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="まぁ、性格なんて、こんなもので測れるものではないですし" \
       ~/Desktop/290.mp3
