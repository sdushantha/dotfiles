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

# Set keyboard layout to Norwegian for Xorg. Seems like 'loadkeys' is not
# persistant and might only affect the TTY session. Same goes with the
# /etc/vconsole.conf
setxkbmap -layout no -variant nodeadkeys

# Merge in defaults and keymaps
xmodmap "$HOME/.Xmodmap"

# Enable tap to click on touchpad
xinput set-prop "ELAN0001:00 04F3:3140 Touchpad" "libinput Tapping Enabled" 1

# TODO: fix natural scrolling 
xinput set-prop "ELAN0001:00 04F3:3140 Touchpad" "libinput Natural Scrolling Enabled" 0

exec i3 --shmlog-size 0

