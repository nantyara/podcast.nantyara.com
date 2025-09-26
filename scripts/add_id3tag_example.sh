ffmpeg -i ~/Desktop/なんちゃラジオ第403回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第403回「月を見て君を想うのか、君を想うから月を見るのか。」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="びっくらポンってね" \
        ~/Desktop/403.mp3
