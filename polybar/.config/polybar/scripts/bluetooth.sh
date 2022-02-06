#!/usr/bin/env bash
bt_connected_icon=""
bt_disconnected_icon=""

device_name=$(bluetoothctl info | sed -n "s/Name: //p" | awk '{$1=$1};1')

if bluetoothctl show | grep -q "Powered: no"; then
    echo -n "$bt_disconnected_icon"
    exit
fi

if bluetoothctl info | grep -q "Missing device address argument"; then
    echo -n "$bt_disconnected_icon"
    exit
fi

if [ ! -z "$device_name" ]; then
    echo -n "$bt_connected_icon $device_name"
    exit
fi
