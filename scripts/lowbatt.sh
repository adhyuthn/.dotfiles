#!/bin/bash

currlevel=$(cat /sys/class/power_supply/BAT0/capacity)
if [ $currlevel -lt 20 ] #&& [ upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state:               discharging" ]
then 
   DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -t 3000 -u  critical "(Battery) 😶"
fi