#!/bin/sh

# Disable Caps Lock
# xmodmap -e "remove lock = Caps_Lock"
setxkbmap -option ctrl:nocaps

# Change language double shift
setxkbmap -option grp:switch,grp:shifts_toggle,grp_led:scroll us,ir

# macbook
xkbcomp -I/home/sadegh/xkb /home/sadegh/xkb/keymap/macbook78 $DISPLA

# start urxvt as a daemon
#urxvtd -q -o -f &

# start the tiling window manager i3
exec i3

# qtile config 
#QTILE=$HOME/.qtile 
# make the cursor move the right speed
#xset mouse 2 9 
# impersonate LG3D so java swing apps work
#wmname LG3D
#exec qtile -c $QTILE/config.py 
