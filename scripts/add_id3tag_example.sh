ffmpeg -i ~/Desktop/なんちゃラジオ第178回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第177回「おいしい低糖質ピザもどきを作ってみた」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="おいしかったけど、サイリウムのトロトロ感が割と強めなので、パンイメージしてると微妙かも" \
       ~/Desktop/178.mp3