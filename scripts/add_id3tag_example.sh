ffmpeg -i ~/Desktop/なんちゃラジオ第201回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第201回「スペシャルゲスト回」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="スペシャルゲスト、誰なんだ一体" \
       ~/Desktop/201.mp3