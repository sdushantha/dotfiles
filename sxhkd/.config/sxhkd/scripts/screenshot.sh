#!/usr/bin/env bash
#
# by Siddharth Dushantha
#
# dependencies: dunstify, maim, xclip and mpv
# 
# Take a screenshot and copy it to your clipboard.
# Then send a notification saying that a screenshot
# was taken and use the screenshot image as the icon
# of the notification. If you click on the notification,
# mpv will open the image so that you can take a look at it
#

FNAME="$HOME/pictures/screenshots/shot_$(date +%y-%m-%d_at_%H-%M-%S).png"

if [ $1 == "-s" ];then
    # Select an area or click a window to take a screenshot of 
    # just the window
    maim -s -u "$FNAME"
else
    maim "$FNAME"
fi

EXIT_CODE=$?

[ $EXIT_CODE -ne 0 ] && exit

xclip -selection clipboard -t image/png < "$FNAME"

[[ $(dunstify -A "show,s" "screenshot saved" "$(basename $FNAME)" -i $FNAME) == "show" ]] && mpv $FNAME
