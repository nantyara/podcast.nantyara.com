ffmpeg -i ~/Desktop/なんちゃラジオ第159回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第159回「現代の海を渡る船」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="普通に風邪ひきましたね...... 違うんだよ？" \
       ~/Desktop/159.mp3