#!/usr/bin/env bash

case $1 in
  up)
    pactl set-sink-mute @DEFAULT_SINK@ 0
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    ;;
  down)
    pactl set-sink-mute @DEFAULT_SINK@ 0
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;
  mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
esac
