ffmpeg -i ~/Desktop/なんちゃラジオ第170回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第170回「春は何かを始める季節です」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="みなさんも、何か始めてみては？" \
       ~/Desktop/170.mp3