ffmpeg -i ~/Desktop/なんちゃラジオ第400回.mp3 \
       -i $(pwd)/images/artwork.jpg \
       -map 0 \
       -map 1 \
       -c copy \
       -c:v:1 mjpeg \
       -id3v2_version 3 \
       -metadata title="第400回「【神回】400回目はさる小をキーステーションにお送りします【公開録音】」" \
       -metadata genre="Podcast" \
       -metadata artist="なんちゃらアイドル" \
       -metadata album="なんちゃラジオ" \
       -metadata TIT3="なんちゃラジオって、そうだったの" \
        ~/Desktop/400.mp3
