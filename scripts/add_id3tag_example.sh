ffmpeg -i ~/Desktop/なんちゃラジオ第293回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第293回「私ってやつぁなんでこんなに寝ちゃうんだ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="人々って休みの日なにやってんだ" \
       ~/Desktop/293.mp3
