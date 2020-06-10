#!/usr/bin/env python

# Requires xcwd
# https://github.com/schischi/xcwd

import sys
import subprocess
import i3ipc
import os

i3 = i3ipc.Connection()


def on(i3, e):
    e.container.command('floating enable')

    e.container.command("resize set 748 px 460 px, move window to position 347 px 230 px")
    sys.exit(0)


os.popen("kitty -d $(xcwd) -e /home/siddharth/bin/utils/vifmrun")

i3.on('window::new', on)
try:
    i3.main()
finally:
    i3.main_quit()
