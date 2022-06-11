ffmpeg -i ~/Desktop/なんちゃラジオ第231回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第231回「文化的な生活である必要性無し」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="もしかしたらお金払ってんのかもしれないけど" \
       ~/Desktop/231.mp3