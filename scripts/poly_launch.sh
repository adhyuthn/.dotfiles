#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done # hack to check if polybar has cosed
polybar --config=/home/evoprime/.config/polybar/config.ini main &
sleep 1
polybar-msg action "#memory.module_toggle"
polybar-msg action "#cpu.module_toggle"
echo "Polybar launched..."
