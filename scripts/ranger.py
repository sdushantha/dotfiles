#!/usr/bin/env python

import sys
import subprocess
import i3ipc

i3 = i3ipc.Connection()


def on(i3, e):
    e.container.command('floating enable')

    e.container.command("resize set 748 px 460 px, move window to position 347 px 230 px")
    sys.exit(0)


subprocess.Popen(['kitty', '--title', 'ranger', 'ranger'], close_fds=True)

i3.on('window::new', on)
try:
    i3.main()
finally:
    i3.main_quit()
