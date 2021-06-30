#!/usr/bin/env bash
cat $HOME/documents/notes/todo | sed "/^+.*$/d" | tr -d "-" | rofi -dmenu 
