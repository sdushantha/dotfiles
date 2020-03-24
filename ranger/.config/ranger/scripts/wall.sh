#!/usr/bin/env bash
#
# This script is used to change my wallpaper and the image for
# my lockscreen. It also changes the background of some of programs
# why using pywal to extract the colors from the image.
#
# This script is binded to CTRL+W in ranger.

# This is where the wallpaper which is going to be used is stored
path="$HOME/pictures/current/"

# Delete current wallpaper
rm $path*

# Copy given image to the Wallpaper directory
cp "$1" "$path"

# Set the wallpaper using feh
setroot -z $path*

# Change the background color of some programs
#bash $HOME/.config/ranger/scripts/color.sh

# Updates the image for betterlockscreen
betterlockscreen -u $path* &> /dev/null
dunstify "ranger" "Image set as wallpaper and lockscreen"

