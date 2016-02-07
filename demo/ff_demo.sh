#!/bin/sh

/home/root/bin/ffmpeg/ffmpeg -s 1280x720 -f video4linux2 -i /dev/video0 -s 1280x720 -f video4linux2 -i /dev/video1 -t 00:00:10 output1 -t 00:00:10 output2