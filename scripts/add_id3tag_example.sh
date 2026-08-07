ffmpeg -i ~/Desktop/なんちゃラジオ第448回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第448回「上半期ベストバイ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ZERUのワンデーカラコン、色はウォーターシルバーもかわいくて買ってよかったけど、開けづらい" \
       ~/Desktop/448.mp3
