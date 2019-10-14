#!/bin/bash

Xvfb :1 -screen 0 ${RESOLUTION}x16 &> xvfb.log  &

cd /root/esmini/build/EnvironmentSimulator/EgoSimulator/
target=$(echo $SCENARIO | sed 's/\(.*\).xosc/\1\.gif/')
timeout $LENGTH ./EgoSimulator --window 0 0 ${RESOLUTION//x/ } --osc "/scenarios/${SCENARIO}" --ext_control off &
avconv -f x11grab -s $RESOLUTION -r $FRAMERATE -t $LENGTH -y -i :1.0 "/scenarios/${target}"
