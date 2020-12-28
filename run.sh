#!/bin/bash

Xvfb :1 -screen 0 ${RESOLUTION}x16 &> xvfb.log  &

cd ~/esmini

# GIF animation format is default. Can be changed into anything supported by ffmpeg, e.g. VIDEO_FORMAT=mp4
target=`sed "s/\(.*\).xosc/\1\.${VIDEO_FORMAT}/" <<< $(basename $SCENARIO)`

# Video and .dat file will end up in the appointed scenarios folder
timeout $LENGTH ./bin/esmini --window 0 0 ${RESOLUTION//x/ } --osc "/scenarios/${SCENARIO}" --record /scenarios/`sed -e 's|.xosc|.dat|g' <<< $(basename ${SCENARIO})` --disable_controllers --aa_mode 0 --info_text off & 
ffmpeg -f x11grab -s $RESOLUTION -r $FRAMERATE -t $LENGTH -y -i :1.0 "/scenarios/${target}"
