#!/usr/bin/env bash
#
# This script allows me to run libreoffice with a light GTK theme.
# To be able to get the light theme when launching the apps from your app
# launcher, edit the .desktop file for all of the libreoffice. All you have
# to do is to replace "libreoffice" with the path to this script in the exec
# variable.
# 
# Keep note, there are usually 2 "Exec" variables in each .desktop file.
#
# Example (diff):
#  - Exec=libreoffice --writer
#  + Exec=/path/to/this/script.sh --writer

GTK_THEME="Arc" libreoffice $1
