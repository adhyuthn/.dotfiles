#!/usr/bin/bash 
m=100

while [ $m -ge 0 ]; do
  echo "0" > /sys/class/leds/input3::capslock/subsystem/input3::capslock/brightness  
  sleep 0.01
  echo "1" > /sys/class/leds/input3::capslock/subsystem/input3::capslock/brightness  
  echo $m
  sleep 0.1
  ((m--))
done

