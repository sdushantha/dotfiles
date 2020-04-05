#!/usr/bin/env bash
#
# by Siddharth Dushantha
#
# Once the lockscreen is shown, kill clearine, so that when I log back in
# I wont see clearine

bash $HOME/bin/keybinded/lock &
sleep 1
killall clearine
