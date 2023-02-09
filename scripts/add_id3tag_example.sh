ffmpeg -i ~/Desktop/なんちゃラジオ第266回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第266回「10年後も同じ歌君に歌いたい」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="生誕ライブありがとうございました" \
       ~/Desktop/266.mp3
