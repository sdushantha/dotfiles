#!/usr/bin/env bash

current_source=$(pactl info | grep "Default Source" | cut -f3 -d" ")
mic_is_on=$(pactl list sources | grep -A 10 $current_source | grep "Mute: no" )

if [ $? -eq 0 ]; then
    printf %s ""
else
    printf %s ""
fi
