#!/usr/bin/env bash

dunstify "wifi" "IP: $(hostname --ip-address)\nRouter: $(ip route show | awk '/default/ {print $3}')" 
