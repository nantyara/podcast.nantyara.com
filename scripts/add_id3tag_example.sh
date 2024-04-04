ffmpeg -i ~/Desktop/なんちゃラジオ第326回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第326回「食パンをとめるやつはバッグクロージャー」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="折りたたみ傘を買ったんですが" \
        ~/Desktop/326.mp3
