#!/bin/sh
#https://trac.ffmpeg.org/wiki/Encode/MPEG-4

/home/root/bin/ffmpeg/ffmpeg -s 1280x720 -i vid1.mp4 -s 1280x720 -i vid2.mp4 -filter_complex "nullsrc=size=2560x720 [base]; [0:v] setpts=PTS-STARTPTS, scale=1280x720 [left]; [1:v] setpts=PTS-STARTPTS, scale=1280x720 [right]; [base][left] overlay=shortest=1 [tmp1]; [tmp1][right] overlay=shortest=1:x=1280" -vcodec mpeg4 -b:v 500k -r 5 out.mp4