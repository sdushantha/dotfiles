#!/usr/bin/env bash
for hexcode in $(find /tmp/farge -type f -exec basename {} .png \;); do
    echo -en "#$hexcode\0icon\x1f/tmp/farge/$hexcode.png\n" 
done 
