#!/bin/bash

IN=Overview_pitch_3.mp4
OUT=Overview_pitch_3_2mins.mp4

# get the duration of the input video
OLDDURATION=$(ffprobe -v error -show_format -show_streams ${IN} | sed -n -e 's/duration=\(.*\)/\1/p' | head -1)
# desired 
NEWDURATION=120.000000 # 2 mins

#$(ffprobe -v error -show_format -show_streams Overview_pitch_3.mp4 | sed -n -e 's/duration=\(.*\)/\1/p' | head -1)

#echo "setpts=(${NEWDURATION}/${OLDDURATION})*PTS"
ffmpeg -i $IN -r 60 -filter:v "setpts=(${NEWDURATION}/${OLDDURATION})*PTS" $OUT

