#!/bin/sh

echo "HandlePowerKey=suspend
HandleLidSwitch=suspend" >> /etc/systemd/logind.conf
