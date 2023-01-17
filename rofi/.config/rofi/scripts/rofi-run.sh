#!/usr/bin/env bash
cmd=$(rofi -dmenu -i -no-fixed-num-lines -theme run)
output=$(zsh -c "$cmd")
[[ ! -z "$output" ]] && notify-send "Shell Output" "$output"
