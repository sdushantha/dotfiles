#!/usr/bin/env python

import sys
import subprocess
import i3ipc

i3 = i3ipc.Connection()


def on(i3, e):
    if e.container.window_class == 'kitty':
        e.container.command('floating enable')

        e.container.command("resize set 748 px 460 px, move window to position 347 px 230 px")
        sys.exit(0)


workspace_empty = i3.get_tree().find_focused().type == 'workspace'
subprocess.Popen(['kitty', '--title', 'kitty'], close_fds=True)

if not workspace_empty:
    sys.exit(0)

i3.on('window::new', on)
try:
    i3.main()
finally:
    i3.main_quit()
