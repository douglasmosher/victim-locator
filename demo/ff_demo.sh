#!/bin/sh

/home/root/bin/ffmpeg/ffmpeg -s 1280x720 -f video4linux2 -i /dev/video0 -s 1280x720 -f video4linux2 -i /dev/video1 -c:v libx264 -c:a aac -strict experimental -b:v 1000k -f mp4 -t 00:00:10 output1.mp4 -c:v libx264 -c:a aac -strict experimental -b:v 1000k -f mp4 -t 00:00:10 output2.mp4