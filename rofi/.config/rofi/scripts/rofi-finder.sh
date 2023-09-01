path="$1"

selection=$(find "$path" -type f 2>/dev/null | \
    sed "s;$HOME;~;" | \
    rofi -sort -sorting-method fzf -disable-history -dmenu)

open "$selection"
