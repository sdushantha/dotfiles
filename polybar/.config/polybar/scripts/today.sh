#!/bin/sh

DATE="$(date +"%a %d %H:%M")"

case "$1" in
--calendar)
    gnome-calendar
    ;;
*)
    echo "$DATE"
    ;;
esac
