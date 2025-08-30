ffmpeg -i ~/Desktop/なんちゃラジオ第399回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第399回「ベロの位置ってどこが正しいんだ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="こんにちは〜！（ウィスパーボイス）（レッドゾーン）" \
        ~/Desktop/399.mp3
