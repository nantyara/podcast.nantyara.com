ffmpeg -i ~/Desktop/なんちゃラジオ第395回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第395回「しりとりやる」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="とりあえず一戦、やらせていただきます" \
        ~/Desktop/395.mp3
