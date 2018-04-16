#!/bin/bash

#Picks a file name for the output file based on availability:

while [[ -f $HOME/video$n.mkv ]]
do
    n=$((n+1))
done
filename="$HOME/video$n.mkv"

#The actual ffmpeg command:

# -s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
ffmpeg \
-f x11grab \
-s $(xrandr --query | grep -m 1 \* | awk '{print $1;}') \
-i :0.0 \
-c:v libx264 -qp 0 -r 30 $filename
