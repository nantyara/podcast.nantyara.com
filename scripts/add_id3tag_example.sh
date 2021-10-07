ffmpeg -i ~/Desktop/なんちゃラジオ第196回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第196回「あぽかりぷす〜」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ゾンビとかアポカリプスとか好きなんですよね" \
       ~/Desktop/196.mp3