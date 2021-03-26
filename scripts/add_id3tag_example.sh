ffmpeg -i ~/Desktop/なんちゃラジオ第168回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第168回「わけわかんない！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="大阪から、久しぶりに２人で、お送りしています！！！！" \
       ~/Desktop/168.mp3