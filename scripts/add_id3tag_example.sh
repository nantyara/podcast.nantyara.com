ffmpeg -i ~/Desktop/なんちゃラジオ第270回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第270回「5周年だったの知らなかったってば！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="最近聴き始めたって人もいて、嬉しいですね" \
       ~/Desktop/270.mp3
