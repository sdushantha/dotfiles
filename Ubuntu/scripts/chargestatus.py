#!/usr/bin/env python3

import os

path = "/sys/class/power_supply/BAT0/"
status = "status"

def get_status():
	fname = path + status
	f = open(fname, "r")
	return f.read().strip()

current_status = get_status()

while True:

	if get_status() != current_status:
		cmd = """notify-send "{}" """
		os.system(cmd.format(get_status()))
		current_status = get_status()
