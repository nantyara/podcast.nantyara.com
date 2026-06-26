ffmpeg -i ~/Desktop/なんちゃラジオ第442回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第442回「夢で食べたあのパンが食べたい」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="各々うまいことやっといてください" \
       ~/Desktop/442.mp3
