ffmpeg -i ~/Desktop/なんちゃラジオ第450回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第450回「すみません、かみまみた」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ラジオ途中にマウスピースをつけて、滑舌が悪くなったと笑っていますが、冒頭から滑舌悪いです" \
       ~/Desktop/450.mp3
