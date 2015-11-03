#!/bin/bash
brightness=$(cat "/sys/class/leds/smc::kbd_backlight/brightness")
a=$((brightness+1))

if [ "$brightness" -lt 3 ]
then
echo $a >> /sys/class/leds/smc\:\:kbd_backlight/brightness
fi
