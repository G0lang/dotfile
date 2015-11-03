#!/bin/sh

# Disable Caps Lock
# xmodmap -e "remove lock = Caps_Lock"
setxkbmap -option ctrl:nocaps

# Change language double shift
setxkbmap -option grp:switch,grp:shifts_toggle,grp_led:scroll us,ir

# start urxvt as a daemon
urxvtd -q -o -f &

# start the tiling window manager i3
exec i3

