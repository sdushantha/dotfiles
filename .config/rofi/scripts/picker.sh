# Where to save the emojis file.
EMOJI_FILE="$HOME/.config/rofi/scripts/unicode.txt"

function rofi_menu() { # {{{
	rofi -width 25 -lines 7 -dmenu -i -p 'emoji' \
		-kb-row-tab '' \
		-kb-row-select Tab \
		-kb-custom-1 Ctrl+c
}
# }}}

function repeat() { # {{{
	local rplc str="$1" count="$2"
	rplc="$(printf "%${count}s")"
	echo "${rplc// /"$str"}"
}
# }}}

function toclipboard() { # {{{
	xclip -i -selection primary
	xclip -o -selection primary | xclip -i -selection clipboard
}
# }}}

function display() {
	local emoji line exit_code quantifier

	emoji=$(cat "$EMOJI_FILE" | grep -v '#' | grep -v '^[[:space:]]*$')
	line="$(echo "$emoji" | rofi_menu)"
	exit_code=$?

	line=($line)
	last=${line[${#line[@]}-1]}
	quantifier="${last:${#last}-1:1}"
	if [[ ! "$quantifier" =~ [0-9] ]]; then
		quantifier=1
	fi
	emoijs="$(repeat "${line[0]}" "$quantifier")"

	if [ $exit_code == 0 ]; then
		xdotool type --clearmodifiers "$emoijs"
		echo -n "$emoijs" | toclipboard
	elif [ $exit_code == 10 ]; then
		echo -n "$emoijs" | toclipboard
	fi
}

# display displays :)
display
