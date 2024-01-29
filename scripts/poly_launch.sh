#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar --config=/home/evoprime/.config/polybar/config.ini main &
echo "Polybar launched..."
