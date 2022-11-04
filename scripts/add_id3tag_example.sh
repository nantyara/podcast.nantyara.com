ffmpeg -i ~/Desktop/なんちゃラジオ第252回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第252回「女の子ってすげぇなって思った話」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="バキバキに噛んでも録り直しません" \
       ~/Desktop/252.mp3