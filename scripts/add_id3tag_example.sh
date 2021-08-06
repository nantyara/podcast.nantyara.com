ffmpeg -i ~/Desktop/なんちゃラジオ第187回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第187回「なんでもないような事が幸せだったと思う」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="本日も、ご聴、ありがとうございます" \
       ~/Desktop/187.mp3