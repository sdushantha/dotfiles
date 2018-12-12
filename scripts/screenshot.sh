#!/bin/bash

FNAME="Screenshot_%y-%m-%d_at_%H-%M-%S.png"

if [[ $1 = "-s" ]];then
    scrot $FNAME -s -e 'mv $f ~/Pictures/Screenshots; viewnior ~/Pictures/Screenshots/$f'
else    
    scrot $FNAME -e 'mv $f ~/Pictures/Screenshots; viewnior ~/Pictures/Screenshots/$f'

fi
