ffmpeg -i ~/Desktop/なんちゃラジオ第177回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第177回「ぬるだ〜！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ぬるというのは、なんちゃらアイドルの割と初期の元メンバーです" \
       ~/Desktop/177.mp3