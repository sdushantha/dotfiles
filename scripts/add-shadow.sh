#!/bin/bash

# This script adds a cool shadow effect to images, just like MacOS screenshots.
# I usually use this for screenshots that I take with scrot
# Source: https://stefanscherer.github.io/how-to-take-screenshots-with-drop-shadow/

convert "$1" \( +clone -background grey25 -shadow 80x40+5+30 \) +swap -background transparent -layers merge +repage "$1-shadow.png"
