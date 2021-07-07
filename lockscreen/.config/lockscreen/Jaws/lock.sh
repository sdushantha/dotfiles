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
    --time-str="%H:%M"                 \
    --time-font="Amity Jack"	       \
    --time-size=70                     \
    --time-color="#2e3440ff"           \
    --time-pos="400:750"               \
    \
    --date-str="%A, %d %B"             \
    --date-color="#2e3440ff"           \
    --date-font="Amity Jack"           \
    --date-size=50                     \
    --date-pos="tx:800"                \
    \
    --verif-font="Amity Jack"          \
    --verif-color="#2e3440ff"          \
    --verif-size=67                    \
    --verif-pos="400:800"              \
    --verif-text="Welcome home!"	   \
    \
    --wrong-font="Amity Jack"          \
    --wrong-color="#b84639ff"          \
    --wrong-size=70                    \
    --wrong-pos="400:800"              \
    --wrong-text="No Entry!"		   \
    \
    --image="$HOME/.config/lockscreen/Jaws/wallpaper.png"            \
    --fill                             \
