#!/bin/bash

Xvfb :1 -screen 0 320x240x16 &> xvfb.log  &

cd /root/esmini/build/EnvironmentSimulator/EgoSimulator/
target=$(echo $SCENARIO | sed 's/\(.*\).xosc/\1\.gif/')
timeout $LENGTH ./EgoSimulator --window 0 0 320 240  --osc /scenarios/$SCENARIO --ext_control off &
avconv -f x11grab -s qvga -r 20 -t $LENGTH -y -i :1.0 /scenarios/$target

