#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
# 
# NOTICE: the exec commands MUST be the last command in this file.
#         anything after it WON'T get executed!
#

# Dont clutter the home directory
USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
ALTUSERXSESSION="$XDG_CACHE_HOME/X11/Xsession"
ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"

xrdb -merge ~/.Xresources

# Set keyboard layout to Norwegian for Xorg. Seems like 'loadkeys' is not
# persistant and might only affect the TTY session. Same goes with the
# /etc/vconsole.conf
setxkbmap -layout no -variant nodeadkeys -option caps:swapescape -option altwin:swap_lalt_lwin

exec i3 --shmlog-size 0

