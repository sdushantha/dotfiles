#!/usr/bin/env bash
#
# Author: Siddharth Dushantha
#
# This script lets me draw a kitty terminal on i3wm
# WARNING: This script only works with kitty and i3wm. If you want to this
#          script to work with your terminal and WM/DE, you will have to edit
#          the script yourself.
#
# Dependencies
#   slop
#   xdotool
#   i3-msg
#   kitty

# This script sometimes works breaks at times

out=$(slop -f "%w %h %x %y")
W=$(echo $out | cut -d " " -f1-1)
H=$(echo $out | cut -d " " -f2-2)
X=$(echo $out | cut -d " " -f3-3)
Y=$(echo $out | cut -d " " -f4-4)

urxvt -name "draw_urxvt" -geometry $Wx$H+$X+$Y &
#sleep 0.18
#i3-msg "[id=$(xdotool getactivewindow)]" floating enable
#
#xdotool getactivewindow windowsize $W $H windowmove $X $Y 
