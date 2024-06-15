ffmpeg -i ~/Desktop/なんちゃラジオ第336回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第336回「なにもかもわからなくなっちゃった」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="自分の名前とあおはるの誕生日くらいしか覚えてないですね" \
        ~/Desktop/336.mp3
