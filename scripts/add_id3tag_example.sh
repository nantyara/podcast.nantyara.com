ffmpeg -i ~/Desktop/なんちゃラジオ第345回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第345回「タイトルは感じ取るタイプの回」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="大人の文化祭、楽しかった" \
        ~/Desktop/345.mp3
