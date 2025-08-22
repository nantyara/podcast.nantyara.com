ffmpeg -i ~/Desktop/なんちゃラジオ第398回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第398回「福岡とサプリメント」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="チチチチチチチチ、ダン！" \
        ~/Desktop/398.mp3
