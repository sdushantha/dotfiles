#!/bin/bash

function up { echo "up"; } # put your commands inside brackets
function down { echo "down"; }

while true # create a loop
do 
	read -rsn1 keyboard_input # inside loop, read keyboard input (read -rsn1 var_name)

case "$keyboard_input" in # create case statements
	u) up # case keyboard input is 'u', call function "up"
  ;;
    d) down # case input is "d", call function "down"
  ;;
    *) echo "type u or d" # case any other key, echo "..."
  ;; 
esac # end case
done # end loop 
