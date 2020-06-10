#!/usr/bin/env bash
#
# Created by Siddharth Dushantha (sdushantha)
#
# Dependencies: xdotool, mpv, xclip, youtube-dl
# 
# This script lets you pop almost any video from your web browser
# into mpv. If you are not using a browser, then the script will
# look in your clipboard to see if you have copied an url which
# can be played on mpv.
# 
# The reason I made this script was because I fed up of dragging
# the url into mpv everytime I wanted to view a YouTube video
# on mpv. 
# 
# ==How you can use this==
# - Copy a url to a video and run the script and it will show it in mpv
# - While on the webpage with the video, run the script, and the
#   video will be shown in mpv
#
# This script was tested using Firefox, so if you use another
# browser, replace the value for WEB_BROSWER with the name
# of your web browser (e.g Google Chrome, Opera, etc.)


# Edit this with the name of your web browser
WEB_BROWSER="Mozilla Firefox"

# Checking if the user is currently on the web browser
CURRENT=$(xdotool getwindowfocus getwindowname | grep "$WEB_BROWSER")

# Get the exit code of the command above.
# If the user is using a web browser, then the 
# exit code will be 0
STATUS=$?

# If the user is using web browser...
if [ $STATUS -eq 0 ];then
    # Then select the url bar and copy the url
    xdotool key ctrl+l
    xdotool key ctrl+c
fi

# Get the content from the clipboard
URL=$(xclip -selection clipboard -o)
    
notify-send "mpv" "Fetching video..."
mpv $URL 

# Get the exit code if mpv
STATUS=$?

if [ $STATUS -ne 0 ];then
    notify-send "mpv" "Failed to fetch the video"
    exit
fi


