ffmpeg -i ~/Desktop/なんちゃラジオ第234回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第234回「あっちいのでこまめに水分補給しようの会」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="こまめってなんだか知ってますか？" \
       ~/Desktop/234.mp3