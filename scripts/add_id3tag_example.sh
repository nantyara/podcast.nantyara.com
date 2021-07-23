ffmpeg -i ~/Desktop/なんちゃラジオ第185回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第185回「秋田遠征」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="あおはる風呂ラジオ、秋田遠征についてです" \
       ~/Desktop/185.mp3