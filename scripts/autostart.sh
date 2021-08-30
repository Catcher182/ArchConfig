#!/bin/bash

/bin/bash ~/scripts/dwm-status.sh &
/bin/bash ~/scripts/wp-autochange.sh &
picom -b
#wpa_supplicant -c ~/wifimi.conf -i wlp0s20f3 &
#dhcpcd &
nm-applet &
xfce4-power-manager&
fcitx5&
xfce4-clipman&

