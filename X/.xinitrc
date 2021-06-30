#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
# 
# NOTICE: the exec commands MUST be the last command in this file.
#         anything after it WON'T get executed!
#

# Set keyboard layout to Norwegian for Xorg. Seems like 'loadkeys' is not
# persistant and might only affect the TTY session. Same goes with the
# /etc/vconsole.conf
setxkbmap -layout no

# Merge in defaults and keymaps
xmodmap "$HOME/.Xmodmap"

# Show lockscreen on start up because thats the only security I have
bash $HOME/bin/utils/lock

#sxhkd &
exec i3 --shmlog-size 0

