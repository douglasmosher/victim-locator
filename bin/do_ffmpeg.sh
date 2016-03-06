#!/bin/sh
#https://trac.ffmpeg.org/wiki/Encode/MPEG-4
#/home/root/bin/ffmpeg/ffmpeg -s 1280x720 -f video4linux2 -i /dev/video0 -s 1280x720 -f video4linux2 -i /dev/video1 -filter_complex "nullsrc=size=2560x720 [base]; [0:v] setpts=PTS-STARTPTS, scale=1280x720 [left]; [1:v] setpts=PTS-STARTPTS, scale=1280x720 [right]; [base][left] overlay=shortest=1 [tmp1]; [tmp1][right] overlay=shortest=1:x=1280" -c:v libx264 -c:a aac -strict experimental -tune zerolatency -movflags +faststart -b:v 500k -f mp4 http://192.168.0.22:8082/out.mp4

#/home/root/bin/ffmpeg/ffmpeg -s 1280x720 -f video4linux2 -i /dev/video0 -s 1280x720 -f video4linux2 -i /dev/video1 -filter_complex "nullsrc=size=2560x720 [base]; [0:v] setpts=PTS-STARTPTS, scale=1280x720 [left]; [1:v] setpts=PTS-STARTPTS, scale=1280x720 [right]; [base][left] overlay=shortest=1 [tmp1]; [tmp1][right] overlay=shortest=1:x=1280" --c:v libvpx-vp9 -crf 62 -b:v 500k -c:a libvorbis http://192.168.0.22:8082/out.mp4

echo "Did we make it here?"
/home/root/bin/ffmpeg/ffmpeg -i vid1.mp4 /home/root/victim-locator/web/client/ts/out_1.m3u8