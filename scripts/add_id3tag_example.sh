ffmpeg -i ~/Desktop/なんちゃラジオ第311回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第311回「サブスク無限列車編」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ちょっと聞いて下さいよdropboxについて" \
        ~/Desktop/311.mp3
