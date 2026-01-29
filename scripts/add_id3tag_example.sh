ffmpeg -i ~/Desktop/なんちゃラジオ第421回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第421回「連続主催ありがとうとか」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="2026年1月27,28,29日、ありがとうございました" \
        ~/Desktop/421.mp3
