ffmpeg -i ~/Desktop/なんちゃラジオ第379回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第379回「今年度やりたいこと」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="４月、ある意味で区切りの季節だと思うんです" \
        ~/Desktop/379.mp3
