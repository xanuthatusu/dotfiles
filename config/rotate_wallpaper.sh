#!/bin/bash
file=($(awk 'f{print;f=0} /'$(cat /tmp/last_wallpaper.txt)'/{f=1}' /home/anthony/images/wallpapers/wallpapers.txt))
if [ -z "$file" -a "$file" != " " ]; then
    file="hackers.jpg"
fi
echo $file > /tmp/last_wallpaper.txt
file="/home/anthony/images/wallpapers/$file"
feh --bg-fill $file
