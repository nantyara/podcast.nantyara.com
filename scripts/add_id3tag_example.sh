ffmpeg -i ~/Desktop/なんちゃラジオ第164回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第164回「かちゅぜちゅとれーにんぐ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ういろううりをご活用ください" \
       ~/Desktop/164.mp3