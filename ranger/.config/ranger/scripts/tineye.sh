#!/usr/bin/env bash
#
# By Siddharth Dushantha (sdushantha)
#
# This script takes an image as the input and then does a reverse image search
# using tineye and shows the results in your web browser.
#
# Small tip
#  This script can be very useful if you use ranger or sxiv because you can
#  make a keybinding which takes the selected file as the input for this script
#  and then do a reverse image search.
#
#  Also, if you use a window manager like i3wm or dwm, you could add a command 
#  to your ranger or sxiv so that when tineye.sh runs, it also changes focus
#  or workspace to your web browser

IMAGE=$1
TINEYE_ENDPOINT="https://tineye.com/search?url="
FILE_TYPE=$(file -b $IMAGE)

# Making sure the given file is a filetype which Tineye supports
if ! egrep -q "^(JPEG|PNG|GIF|BMP|TIFF|RIFF)" <<< "$FILE_TYPE"; then
    echo "File must be JPEG, PNG, GIF, BMP, TIFF or WebP" &&
    exit 1
fi

# Since a subscription is needed to use the API to upload an image, we can work
# around that by first uploading the image to 0x0.st and then put the url to
# the image in the url parameter.
IMAGE_URL=$(curl -s -F"file=@$IMAGE" https://0x0.st)

# Open the url using the web browser defined by xdg
xdg-open "$TINEYE_ENDPOINT$IMAGE_URL"
