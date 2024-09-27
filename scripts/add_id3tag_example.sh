ffmpeg -i ~/Desktop/なんちゃラジオ第351回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第351回「人間性とベーコンは分厚ければ分厚いほどいいですからね」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="人間って、いっぱいいるじゃないですか" \
        ~/Desktop/351.mp3
