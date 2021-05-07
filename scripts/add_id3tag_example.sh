ffmpeg -i ~/Desktop/なんちゃラジオ第174回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第174回「幸せってなんだろ？幸せってなあに？って曲あったよなぁ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ゴールデンウィーク、終わりましたか？" \
       ~/Desktop/174.mp3