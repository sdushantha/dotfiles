#!/usr/bin/env bash
for file in $(ls -tl /tmp/farge | cut -d " " -f 9); do
    hex_code=$(echo $file | cut -d"." -f 1) 
    echo -en "#$hex_code\0icon\x1f/tmp/farge/$file\n" 
done | rofi -dmenu | xclip -sel c
