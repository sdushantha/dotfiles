# TODO: add xclip checker and ability to copy the IP
#       send notification upon copying
interface="$(ip tuntap show | cut -d : -f1 | head -n 1)"
ip="$(ip a s "${interface}" 2>/dev/null | grep -o -P '(?<=inet )[0-9]{1,3}(\.[0-9]{1,3}){3}')"


case "$1" in
    --copy)
        if [ -n "$ip" ]; then
            echo -n "$ip" | xclip -sel c
            notify-send "OpenVPN" "IP copied to clipboard"
        fi
        ;;
    *)
        if [ -n "$ip" ]; then
            echo "󰒄 $ip"
        else
            echo ""
        fi
        ;;
esac




