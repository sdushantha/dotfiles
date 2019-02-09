#!/bin/sh

# Pause mpd and send the pause key to all mpv videos:
mpc pause >/dev/null 2>&1
pauseallmpv >/dev/null 2>&1

betterlockscreen -l

