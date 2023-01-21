ffmpeg -i ~/Desktop/なんちゃラジオ第263回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第263回「なんちゃラジオ5周年おめでとう」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="1月29日が誕生日なんですよ〜" \
       ~/Desktop/263.mp3