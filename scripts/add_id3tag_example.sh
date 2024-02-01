ffmpeg -i ~/Desktop/なんちゃラジオ第317回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第317回「10周年ありがとうございました」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="１０周年記念ライブをふりかえります" \
        ~/Desktop/317.mp3
