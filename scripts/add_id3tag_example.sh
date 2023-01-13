ffmpeg -i ~/Desktop/なんちゃラジオ第262回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第262回「あけましておめでとうござい、まーーーーーーす！！！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ドラえもんだったり、ニーチェだったり" \
       ~/Desktop/262.mp3