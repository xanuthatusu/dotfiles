#!/bin/bash

tmpbg='/tmp/screen.png'

scrot "$tmpbg"
betterlockscreen -u $tmpbg -b 2
betterlockscreen -l blur