#!/usr/bin/env bash
#
# Siddharth Dushantha 2020
# 
# https://github.com/sdushantha/bin
#

TEXT_FILE="/tmp/ocr.txt"
IMAGE_FILE="/tmp/ocr.png"

# Check if the needed dependencies are installed
dependencies=(tesseract maim notify-send xclip)
for dependency in "${dependencies[@]}"; do
    type -p "$dependency" &>/dev/null || {
        # The reason why we are sending the error as a notification is because
        # user is most likely going to run this script by binding it to their
        # keyboard, therefor they cant see any text that is outputed using echo
        notify-send "ocr" "Could not find '${dependency}', is it installed?"
        exit 1
    }
done

# Take screenshot by selecting the area
maim -s "$IMAGE_FILE"

# Get the exit code of the previous command.
# So in this case, it is the screenshot command. If it did not exit with an
# exit code 0, then it means the user canceled the process of taking a
# screenshot by doing something like pressing the escape key
STATUS=$?

# If the user pressed the escape key or did something to terminate the proccess
# taking a screenshot, then just exit
[ $STATUS -ne 0 ] && exit 1

# Do the magic (∩^o^)⊃━☆ﾟ.*･｡ﾟ
# Notice how I have removing the extension .txt from the file path. This is
# because tesseract adds .txt to the given file path anyways. So if we were to
# specify /tmp/ocr.txt as the file path, tesseract would out the text to 
# /tmp/ocr.txt.txt
tesseract "$IMAGE_FILE" "${TEXT_FILE//\.txt/}" 2> /dev/null

# Remove the new page character.
# Source: https://askubuntu.com/a/1276441/782646
sed -i 's/\x0c//' "$TEXT_FILE"

# Check if the text was detected by checking number
# of lines in the file
NUM_LINES=$(wc -l < $TEXT_FILE)
if [ "$NUM_LINES" -eq 0 ]; then
    notify-send "ocr" "no text was detected"
    exit 1
fi

# Copy text to clipboard
xclip -selection clip < "$TEXT_FILE"

# Send a notification with the text that was grabbed using OCR
notify-send "ocr" "$(cat $TEXT_FILE)"

# Clean up
# "Always leave the area better than you found it" 
#                       - My first grade teacher
rm "$TEXT_FILE"
rm "$IMAGE_FILE"
