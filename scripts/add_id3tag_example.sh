ffmpeg -i ~/Desktop/なんちゃラジオ第462回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第461回「矢継ぎ早にここ2週間の話」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ソロシングルご購入ありがとうございましたっ、が！" \
       ~/Desktop/462.mp3
