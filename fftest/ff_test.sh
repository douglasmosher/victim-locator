#!/bin/sh
#https://trac.ffmpeg.org/wiki/Encode/MPEG-4
#/home/root/bin/ffmpeg/ffmpeg -i vid1.mp4 -i vid2.mp4 -filter_complex "nullsrc=size=2560x720 [base]; [0:v] setpts=PTS-STARTPTS, scale=1280x720 [left]; [1:v] setpts=PTS-STARTPTS, scale=1280x720 [right]; [base][left] overlay=shortest=1 [tmp1]; [tmp1][right] overlay=shortest=1:x=1280" -c:v libx264 out.mp4
#/home/root/bin/ffmpeg/ffmpeg -i vid1.mp4 -i vid2.mp4 -filter_complex "nullsrc=size=2560x720 [base]; [0:v] setpts=PTS-STARTPTS, scale=1280x720 [left]; [1:v] setpts=PTS-STARTPTS, scale=1280x720 [right]; [base][left] overlay=shortest=1 [tmp1]; [tmp1][right] overlay=shortest=1:x=1280" -c:v libvpx-vp9 -crf 62 -b:v 500k -c:a libvorbis output.webm
#/home/root/bin/ffmpeg/ffmpeg -threads 0 -i vid1.mp4 -i vid2.mp4 -filter_complex "nullsrc=size=2560x720 [base]; [0:v] setpts=PTS-STARTPTS, scale=1280x720 [left]; [1:v] setpts=PTS-STARTPTS, scale=1280x720 [right]; [base][left] overlay=shortest=1 [tmp1]; [tmp1][right] overlay=shortest=1:x=1280" -c:v libvpx -crf 62 -b:v 300k /home/root/victim-locator/web/client/output_file.webm
#/home/root/bin/ffmpeg/ffmpeg -threads 0 -i vid1.mp4 -i vid2.mp4 -filter_complex "nullsrc=size=2560x720 [base]; [0:v] setpts=PTS-STARTPTS, scale=1280x720 [left]; [1:v] setpts=PTS-STARTPTS, scale=1280x720 [right]; [base][left] overlay=shortest=1 [tmp1]; [tmp1][right] overlay=shortest=1:x=1280" -codec:v libx264 -profile:v baseline -level 3.0 -preset ultrafast -pix_fmt yuv420p -b:v 500k -maxrate 500k -bufsize 1000k -threads 0 -an /home/root/victim-locator/web/client/output_file.mp4 
/home/root/bin/ffmpeg/ffmpeg -y -i vid1.mp4 -an -c:v libx264 -pix_fmt yuv420p -profile:v baseline -level 1.3 -maxrate 192K -bufsize 1M -crf 18 -r 10 -g 30 -f hls -hls_time 9 -hls_list_size 0 -s 320x180 /home/root/victim-locator/web/client/ts/320x180.m3u8