ffmpeg -i ~/Desktop/なんちゃラジオ第346回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第346回「なか卯行ったことない」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="これは世の真面目なアイドルさんからしたら" \
        ~/Desktop/346.mp3
