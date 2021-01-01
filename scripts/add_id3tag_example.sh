ffmpeg -i ~/Desktop/なんちゃラジオ第156回\ -\ 2021:01:01\ 14.mp3 \
       -i $(pwd)/../images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第156回「メリークリスマス！」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="12月25日の無料ワンマンにて公開録音された回です" \
       ~/Desktop/out_156.mp3