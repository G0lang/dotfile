#!/bin/sh

echo "

blacklist bluetooth
blacklist btusb
blacklist uvcvideo


" > /etc/modprobe.d/50-disabling.conf
