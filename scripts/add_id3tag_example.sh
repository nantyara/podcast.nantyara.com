ffmpeg -i ~/Desktop/なんちゃラジオ第224回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第224回「名古屋大阪いったってわけ！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="久しぶりに運転しました。怖かった" \
       ~/Desktop/224.mp3