#!/usr/bin/env bash
char_file="$HOME/.config/rofi/scripts/chars.txt"
selection="$(cat "$char_file" | rofi -dmenu -i)"
char=$(printf %b "$selection" | cut -d " " -f1)
printf %b "$char" | xclip -selection c
