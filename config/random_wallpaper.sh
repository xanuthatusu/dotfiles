#!/bin/bash
files=(/home/anthony/images/wallpapers/*)
chosen_file=${files[RANDOM % ${#files[@]}]}
feh --bg-fill $chosen_file
