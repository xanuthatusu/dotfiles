#!/bin/bash

icon="$HOME/.config/i3/lock.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"

if [[ -f "$icon" ]]
then
    # placement x/y
    posX=0
    posY=0
    # lockscreen image info
    imageInfo=$(file "$icon" | grep -o '[0-9]* x [0-9]*')
    imageWidth=$(echo $imageInfo | cut -d' ' -f 1)
    imageHeight=$(echo $imageInfo | cut -d' ' -f 3)

    connectedScreens=$(xrandr --query | grep ' connected' | sed 's/primary //' | cut -f3 -d' ')
    for screen in $connectedScreens
    do
        if ! [[ $screen = *normal ]]
        then
            # monitor position/offset
            screenWidth=$(echo $screen | cut -d'x' -f 1)                    # x pos
            screenHeight=$(echo $screen | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
            screenOffsetX=$(echo $screen | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
            screenOffsetY=$(echo $screen | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
            posX=$(($screenOffsetX + $screenWidth/2 - $imageWidth/2))
            posY=$(($screenOffsetY + $screenHeight/2 - $imageHeight/2))

            convert "$tmpbg" "$icon" -geometry +$posX+$posY -composite -matte  "$tmpbg"
            echo "done"
        fi
    done
fi
# dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
# i3lock  -I 10 -d -e -u -n -i "$tmpbg"
i3lock -e -u -n -i "$tmpbg"
