ffmpeg -i ~/Desktop/なんちゃラジオ第259回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第259回「Life goes on全曲レビュー」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="聞（聴）いてくださいよ皆さん" \
       ~/Desktop/259.mp3