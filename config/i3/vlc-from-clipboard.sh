#!/bin/sh

clipboard="$(xclip -o)"
exec vlc "$clipboard"
