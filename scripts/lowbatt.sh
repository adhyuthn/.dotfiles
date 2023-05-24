#!/bin/bash

currlevel=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | tr -d -c 0-9)

if [ $currlevel -lt 100 ]; then 
notify-send -u critical "Plug in or Die"
fi