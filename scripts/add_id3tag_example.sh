ffmpeg -i ~/Desktop/なんちゃラジオ第172回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第172回「新曲紹介しちゃおっかな！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="録りたてほやほやをお聴きください" \
       ~/Desktop/172.mp3