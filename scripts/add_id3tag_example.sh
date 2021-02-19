ffmpeg -i ~/Desktop/なんちゃラジオ第163回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第163回「大きな玉ねぎの下で」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="色んな事を考えた日でした" \
       ~/Desktop/163.mp3