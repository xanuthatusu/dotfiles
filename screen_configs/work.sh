#!/bin/bash
#xrandr --output HDMI1 --mode 1920x1080 --primary --output eDP1 --mode 1920x1080 --right-of HDMI1
xrandr --output HDMI1 --off --output VIRTUAL1 --off --output DP1 --mode 1920x1080 --pos 0x0 --rotate normal --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP2 --off

