ffmpeg -i ~/Desktop/なんちゃラジオ第456回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第456回「ダンゴムシは交替性転向反応で行き先を決めている」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ダンゴムシの話はしていません" \
       ~/Desktop/456.mp3
