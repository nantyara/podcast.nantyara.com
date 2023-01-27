ffmpeg -i ~/Desktop/なんちゃラジオ第264回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第264回「リッキッシーッ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="大型深海魚の新種「ヨコヅナイワシ」を駿河湾で発見" \
       ~/Desktop/264.mp3