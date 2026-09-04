ffmpeg -i ~/Desktop/なんちゃラジオ第452回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第452回「人生は経験や！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="「御茶海マミ」って言いづらいな？" \
       ~/Desktop/452.mp3
