#!/usr/bin/env sh


setGTKTheme(){
    # I run i3 along with GNOME services in the background, therefore
    # I'm able to use 'gsettings'. Change the command according to your system 
    if [ "$1" == "light" ]; then
        gsettings set org.gnome.desktop.interface gtk-theme "Kali-Light"
    elif [ "$1" == "dark" ]; then
        gsettings set org.gnome.desktop.interface gtk-theme "Kali-Dark"
    else
        printf %s "Error in setGTKTheme: got invalid argument '$1'"
    fi
}


setLightMode(){
    setGTKTheme light
}

setDarkMode(){
    setGTKTheme dark 
}

main(){
    while [ "$1" ]; do
        case "$1" in
            on) setDarkMode && exit ;;
            off) setLightMode && exit ;;
        esac
        shift
    done
}

main "$@"
