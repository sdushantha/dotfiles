#!/usr/bin/env bash
TIME_TO_EMPTY=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "time" | xargs | sed -z "s/time to empty: //g")
PERCENTAGE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percent" | xargs | sed -z "s/percentage: //g")
STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state" | xargs | sed -z "s/state: //g")

# This line is very messy. That is why the I have left the 
# above lines so that I can refer back to them in the future
#kitty --hold --title="batterywidget" -e sh -c 'printf "\\e]11;#0d0b0a\\e\\\\" && echo "" && tput civis && PS1="" && stty -echo && printf "\033[1mpercentage: \033[0m" && upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percent" | xargs | sed -z "s/percentage: //g" && printf "\033[1mstate: \033[0m" && upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state" | xargs | sed -z "s/state: //g"' &

#sleep 0.25

#i3-msg [title="batterywidget"] focus, floating enable, resize set 160 110, move position 1230 23

dunstify "percent: $PERCENTAGE"
