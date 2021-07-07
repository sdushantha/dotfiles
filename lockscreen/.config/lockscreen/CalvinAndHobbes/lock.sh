#!/usr/bin/env bash
#
# i3lock theme: Calvin and Hobbes
#
# Originally created by Lokesh Krishna
# Updated formatting to latest version of i3lock-color by Siddharth Dushantha
#

i3lock                                 \
    --nofork                           \
    --ignore-empty-password            \
    \
    --bar-indicator                    \
    --bar-pos="1070"                   \
    --bar-base-width="10"              \
    --bar-orientation=horizontal	   \
    --bar-color=2e3440                 \
    --bshl-color=5e81ac                \
    --keyhl-color=a3be8c			   \
    \
    --clock                            \
    --time-str="%I:%M %p"              \
    --time-font="Calvin and Hobbes"	   \
    --time-size=150                    \
    --time-color=2e3440ff       \
    --time-pos="1470:880"              \
    \
    --date-str="%A, %d %B"		       \
    --date-color=2e3440ff       \
    --date-font="Calvin and Hobbes"	   \
    --date-size=95                     \
    --date-pos="tx:990"               \
    \
    --verif-font="Calvin and Hobbes"   \
    --verif-color=2e3440ff       \
    --verif-size=150			       \
    --verif-text="Welcome home!"	   \
    --wrong-font="Calvin and Hobbes"   \
    --wrong-color=2e3440ff       \
    --wrong-size=150			       \
    --wrong-text="No Entry!"		   \
    \
    --image="$HOME/.config/lockscreen/CalvinAndHobbes/wallpaper.png"       \
