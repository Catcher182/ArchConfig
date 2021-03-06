#!/bin/bash

export IDENTIFIER="unicode"

dwm_battery () {
    #echo " $( acpi -b | awk '{ print $3, $4 }' | tr -d ',' )"
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    if [ "$IDENTIFIER" = "unicode" ]; then
	    if [ "$STATUS" = "Charging" ]; then
		    printf "π %s%%" "$CHARGE" 
	    else
		    printf "π %s%%" "$CHARGE" 
	    fi
    else
	    printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
}

dwm_date () {
    printf "%s" "$(date "+%a %d-%m-%y %T")"
}
print_date(){
	date '+%YεΉ΄%mζ%dζ₯ %H:%M'
}

dwm_alsa () {
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$VOL" -eq 0 ]; then
            printf "π"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "π %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "π %s%%" "$VOL"
        else
            printf "π %s%%" "$VOL"
        fi
    else
        if [ "$VOL" -eq 0 ]; then
            printf "MUTE"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "VOL %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "VOL %s%%" "$VOL"
        else
            printf "VOL %s%%" "$VOL"
        fi
    fi
}

dwm_backlight () {
	printf "π‘ %.0f%%" "$(xbacklight -get)" 
}

#cmusζ­ζΎε¨
dwm_cmus() {
if ps -C cmus > /dev/null; then
	ARTIST=$(cmus-remote -Q | grep -a '^tag artist' | awk '{gsub("tag artist ", "");print}')
	TRACK=$(cmus-remote -Q | grep -a '^tag title' | awk '{gsub("tag title ", "");print}')
	POSITION=$(cmus-remote -Q | grep -a '^position' | awk '{gsub("position ", "");print}')
	DURATION=$(cmus-remote -Q | grep -a '^duration' | awk '{gsub("duration ", "");print}')
	STATUS=$(cmus-remote -Q | grep -a '^status' | awk '{gsub("status ", "");print}')
	SHUFFLE=$(cmus-remote -Q | grep -a '^set shuffle' | awk '{gsub("set shuffle ", "");print}')

	if [ "$IDENTIFIER" = "unicode" ]; then
		if [ "$STATUS" = "playing" ]; then
			STATUS="βΆ"
		else
			STATUS="βΈ"
		fi

		if [ "$SHUFFLE" = "true" ]; then
			SHUFFLE=" π"
		else
			SHUFFLE=""
		fi
	else
		if [ "$STATUS" = "playing" ]; then
			STATUS="PLA"
		else
			STATUS="PAU"
		fi

		if [ "$SHUFFLE" = "true" ]; then
			SHUFFLE=" S"
		else
			SHUFFLE=""
		fi
	fi

	printf "%s%s %s - %s " "$SEP1" "$STATUS" "$ARTIST" "$TRACK"
	printf "%0d:%02d/" $((POSITION%3600/60)) $((POSITION%60))
	printf "%0d:%02d" $((DURATION%3600/60)) $((DURATION%60))
	printf "%s%s\n" "$SHUFFLE" "$SEP2"
fi
}

dwm_network () {
	CONNAME=$(nmcli -a | grep 'Wired connection' | awk 'NR==1{print $1}')
	if [ "$CONNAME" = "" ]; then
		CONNAME=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
	fi
	PRIVATE=$(nmcli -a | grep 'inet4 192' | awk '{print $2}')
	#PUBLIC=$(curl -s https://ipinfo.io/ip)
	
	#printf "π %s %s" "$CONNAME" "$PRIVATE" 
	printf "π %s" "$CONNAME"
}

dwm_network_easy (){
	#θΆζΆζΆι΄
    local timeout=1

    #η?ζ η½η«
    local target=www.baidu.com

    #θ·εεεΊηΆζη 
    local ret_code=`curl -I -s --connect-timeout ${timeout} ${target} -w %{http_code} | tail -n1`

    if [ "x$ret_code" = "x200" ]; then
        #η½η»ηι
        printf "ο¦"
    else
        #η½η»δΈηι
        printf "ο¦"
    fi

}


xsetroot -name "|$(dwm_network_easy)|$(dwm_backlight)|$(dwm_alsa)|$(dwm_battery)|$(print_date)|"

exit 0
