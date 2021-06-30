#!/usr/bin/env bash
#
# Restore the brightness by taking the value in the file, brightness

VALUE=$(cat $HOME/bin/keybinded/brightness/brightness)

xbacklight -set $VALUE
