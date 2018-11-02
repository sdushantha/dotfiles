#!/usr/bin/env bash
#   Source: https://gist.github.com/Tadly/0741821d3694deaec1ee454a95c591fa
#
#   Use rofi to pick emoji because that's what this
#   century is about apparently...
#
#   Requirements:
#     rofi, xsel, xdotool, curl, xmllint
#
#   Usage:
#     1. Download all emoji
#        $ rofi-emoji --download
#
#     2. Run it!
#        $ rofi-emoji
#
#   Notes:
#     * You'll need a emoji font like "Noto Emoji" or "EmojiOne".
#     * Confirming an item will automatically paste it WITHOUT
#       writing it to your clipboard.
#     * Ctrl+C will copy it to your clipboard WITHOUT pasting it.
#

# Where to save the emojis file.
EMOJI_FILE="$HOME/.cache/emojis.txt"

# Urls of emoji to download.
# You can remove what you don't need.
URLS=(
'https://emojipedia.org/people/'
'https://emojipedia.org/nature/'
'https://emojipedia.org/food-drink/'
'https://emojipedia.org/activity/'
'https://emojipedia.org/travel-places/'
'https://emojipedia.org/objects/'
'https://emojipedia.org/symbols/'
'https://emojipedia.org/flags/'
)


function notify() {
	if [ "$(command -v notify-send)" ]; then
		notify-send "$1" "$2"
	fi
}


function download() {
	notify "$(basename "$0")" 'Downloading all emoji for your pleasure'

	echo "" > "$EMOJI_FILE"

	for url in "${URLS[@]}"; do
		echo "Downloading: $url"

		# Download the list of emoji and remove all the junk around it
		emojis=$(curl -s "$url" | \
			xmllint --html \
			--xpath '//ul[@class="emoji-list"]' - 2>/dev/null)

		# Get rid of starting/closing ul tags
		emojis=$(echo "$emojis" | head -n -1 | tail -n +1)

		# Extract the emoji and its description
		emojis=$(echo "$emojis" | \
			sed -rn 's/.*<span class="emoji">(.*)<\/span> (.*)<\/a><\/li>/\1 \2/p')

		echo "$emojis" >> "$EMOJI_FILE"
	done

	notify "$(basename "$0")" "We're all set!"
}

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


# Some simple argparsing
if [[ "$1" =~ -D|--download ]]; then
	download
	exit 0
elif [[ "$1" =~ -h|--help ]]; then
	echo "usage: $0 [-D|--download]"
	exit 0
fi

# Download all emoji if they don't exist yet
if [ ! -f "$EMOJI_FILE" ]; then
	download
fi

# display displays :)
display

