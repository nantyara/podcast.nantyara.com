ffmpeg -i ~/Desktop/なんちゃラジオ第280回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第280回「大阪は食い倒れ、京都は着倒れ、では奈良は？」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="関西遠征に行ってきまっす" \
       ~/Desktop/280.mp3
