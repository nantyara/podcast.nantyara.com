ffmpeg -i ~/Desktop/なんちゃラジオ第255回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第255回「7日間ありがとうございました」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="さて、終わりましたね。ありがとうございました。" \
       ~/Desktop/255.mp3