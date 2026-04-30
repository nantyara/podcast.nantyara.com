ffmpeg -i ~/Desktop/なんちゃラジオ第434回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第434回「また歯の話で恐縮です」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="大阪遠征ありがとうございました" \
       ~/Desktop/434.mp3