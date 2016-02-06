#!/bin/sh
#https://trac.ffmpeg.org/wiki/Encode/MPEG-4

/home/root/bin/ffmpeg/ffmpeg -s 1280x720 -f video4linux2 -i /dev/video0 -s 1280x720 -f video4linux2 -i /dev/video1 -filter_complex "nullsrc=size=2560x720 [base]; [0:v] setpts=PTS-STARTPTS, scale=1280x720 [left]; [1:v] setpts=PTS-STARTPTS, scale=1280x720 [right]; [base][left] overlay=shortest=1 [tmp1]; [tmp1][right] overlay=shortest=1:x=1280" -c:v libx264 -c:a aac -strict experimental -tune zerolatency -movflags +faststart -b:v 900k -f mp4 http://127.0.0.1:8082