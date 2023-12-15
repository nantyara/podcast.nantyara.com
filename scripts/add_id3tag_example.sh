ffmpeg -i ~/Desktop/なんちゃラジオ第310回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第310回「ブラッシュアップライフ」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="ここ最近もね、たくさん色んな事がありましたね〜" \
        ~/Desktop/310.mp3
