#!/bin/bash
#首先执行 sudo chmod 777 /sys/class/backlight/intel_backlight/brightness
/usr/bin/xbacklight -dec 5
bash ~/scripts/dwm-status-refresh.sh
