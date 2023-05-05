ffmpeg -i ~/Desktop/なんちゃラジオ第278回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第278回「山と懐かしの音楽と」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="GWも終盤に差し掛かってきました" \
       ~/Desktop/278.mp3
