#!/usr/bin/env bash

# icon="$HOME/.xlock/icon.png"
tmpbg='/tmp/screen.png'

# (( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"


### Alternative blurred lockscreen

#convert "$tmpbg" -blur 0x4 "$tmpbg"

### Display an icon in the center

# convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"

# -u hides the i3lock ring :
i3lock -i "$tmpbg"
#i3lock -u -i  "$tmpbg"
