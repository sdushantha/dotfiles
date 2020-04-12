#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


DEFAULT_SESSION=i3

# merge in defaults and keymaps

xmodmap "$HOME/.Xmodmap"

exec i3 --shmlog-size 0
# exec bspwm
# sxhkd &
