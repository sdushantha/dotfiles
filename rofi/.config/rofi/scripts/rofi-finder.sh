opener="$1"

selection=$(fd . --hidden --type file $HOME 2>/dev/null | \
    sed "s;$HOME;~;" | \
    rofi -sort -sorting-method fzf -disable-history -dmenu -i -theme default-no-icon -no-custom -p "" | \
    sed "s;\~;$HOME;"
)

$opener "$selection" 
