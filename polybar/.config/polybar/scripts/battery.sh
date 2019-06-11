
FULL=100

charging_animation(){
    while true
    do
        clear
        echo ""
        sleep 0.75
        clear
        echo ""
        sleep 0.75
        clear
        echo ""
        sleep 0.75
        clear
        echo ""
        sleep 0.75
        clear
        echo ""
        sleep 0.75
    done
}


get_battery_value(){
    VALUE=$(cat /sys/class/power_supply/BAT0/capacity)
    VALUE="$VALUE%"
    echo $VALUE

}

get_status(){
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$STATUS" = "Discharging" ]
    then
        CHARGING=false
    else
        CHARGING=true
    fi
}


get_status
echo "$STATUS"

if $CHARGING
then
    charging_animation
fi

get_battery_value
