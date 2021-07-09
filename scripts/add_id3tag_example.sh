ffmpeg -i ~/Desktop/なんちゃラジオ第183回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第183回「改名します（やめました）」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="恒例、あおはるちゃんの、風呂ラジ" \
       ~/Desktop/183.mp3