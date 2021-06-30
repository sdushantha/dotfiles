#!/usr/bin/env bash
#
# Use rofi to select/create notes and then edit them using nvim
#

notes_directory="$HOME/documents/notes"
note_name=$(ls ~/documents/notes | rofi -dmenu -config $HOME/.config/rofi/themes/notes.rasi)
note_path="$notes_directory/$note_name"

[ -n "$note_name" ] && kitty -e nvim "$note_path"
