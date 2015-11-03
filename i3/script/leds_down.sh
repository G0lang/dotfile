#!/bin/bash
brightness=$(cat "/sys/class/leds/smc::kbd_backlight/brightness")
a=$((brightness-1))

if [ "$brightness" -gt 0 ]
then
echo $a >> /sys/class/leds/smc\:\:kbd_backlight/brightness
fi
