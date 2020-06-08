#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
# 
# NOTICE: the exec commands MUST be the last command in this file.
#         anything after it WON'T get executed!
#


# merge in defaults and keymaps
xmodmap "$HOME/.Xmodmap"
#sxhkd &
exec i3 --shmlog-size 0

