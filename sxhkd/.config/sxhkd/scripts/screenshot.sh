#!/usr/bin/env bash
#
# by Siddharth Dushantha
# Take a screenshot and then display the screenshot
# using mpv as a little preview thing.
FNAME="$HOME/pictures/screenshots/shot_$(date +%y-%m-%d_at_%H-%M-%S).png"
if [[ $1 = "-s" ]];then
    # Select an area or click a window to take a screenshot of 
    # just the window
    maim -s -u | xclip -selection clipboard -t image/png
# v=$(maim -s -u) && printf "%s" "$v" | xclip -selection clipboard -t image/png
    xclip -o -selection clipboard -t image/png > $FNAME
    [[ $(dunstify -A "show,s" "screenshot saved" "$(basename $FNAME)" -i $FNAME) == "show" ]] && mpv $FNAME
else
    # Screenshot of whole screen
    maim | xclip -selection clipboard -t image/png
    xclip -o -selection clipboard -t image/png > $FNAME
    [[ $(dunstify -A "show,s" "screenshot saved" "$(basename $FNAME)" -i $FNAME) == "show" ]] && mpv $FNAME
fi
