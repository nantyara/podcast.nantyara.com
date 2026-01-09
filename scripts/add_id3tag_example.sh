ffmpeg -i ~/Desktop/なんちゃラジオ第418回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第418回「新年明けましておめでとう午ざいます」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="超絶技巧ベース教本をやることです" \
        ~/Desktop/418.mp3
