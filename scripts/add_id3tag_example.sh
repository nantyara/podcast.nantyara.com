ffmpeg -i ~/Desktop/なんちゃラジオ第179回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第179回「雑談回です！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="すごく雑談をね、してみちゃおっかな" \
       ~/Desktop/179.mp3