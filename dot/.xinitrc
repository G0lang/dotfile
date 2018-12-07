# Adjust keyboard typematic delay and rate
# xset r rate 270 30
# Start Xorg server at this DPI
# xrandr --dpi 190
# Merge & load configuration from .Xresources
# xrdb -merge ~/.Xresources
# Let QT and GTK autodetect retina screen and autoadjust
# export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5

# Disable Caps Lock
xmodmap -e "remove lock = Caps_Lock"
setxkbmap -option ctrl:nocaps

# Change language double shift
setxkbmap -option grp:switch,grp:shifts_toggle,grp_led:scroll us,ir

# macbook
xkbcomp -I /home/sadegh/dotfile/macbook/kbd $DISPLA

# Finally start i3wm
exec i3
