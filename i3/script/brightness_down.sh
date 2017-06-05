#!/bin/bash
brightness=$(cat "/sys/class/backlight/acpi_video0/brightness")
a=$((brightness-1))

if [ "$brightness" -gt 0 ]
then
echo $a >> /sys/class/backlight/acpi_video0/brightness
fi
