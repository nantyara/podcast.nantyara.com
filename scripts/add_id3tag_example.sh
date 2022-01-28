ffmpeg -i ~/Desktop/なんちゃラジオ第212回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第212回「怪物と植物は土から生まれる…ってこと！？」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="超絶カッコイイジングルになりましたね" \
       ~/Desktop/212.mp3