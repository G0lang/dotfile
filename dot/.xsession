#!/bin/sh

# Disable Caps Lock
# xmodmap -e "remove lock = Caps_Lock"
setxkbmap -option ctrl:nocaps

# Change language double shift
setxkbmap -option grp:switch,grp:shifts_toggle,grp_led:scroll us,ir

# macbook
xkbcomp -I /home/sadegh/dotfile/macbook/kbd $DISPLA

