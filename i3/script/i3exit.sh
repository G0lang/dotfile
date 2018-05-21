#!/bin/sh

case "$1" in
    lock)
        bash /home/sadegh/dotfile/i3/script/lock_and_blur.sh
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        sudo pm-suspend | i3lock -c 000000
        ;;
    hibernate)
	systemctl hibernate
        ;;
    reboot)
        reboot
        ;;
    shutdown)
        shutdown now
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
