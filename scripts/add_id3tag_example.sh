ffmpeg -i ~/Desktop/なんちゃラジオ第371回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第371回「その肩幅、道路交通法違反です！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="肩幅ヒロシさんゲスト回です！" \
        ~/Desktop/371.mp3
