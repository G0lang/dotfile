#!/bin/sh

case "$1" in
    mount)
        sudo mount -o rw,users /dev/sdb1 ~/media
        ;;
    umount)
        sudo umount ~/media
        ;;
    *)
        echo "Usage: $0 {mount|umount}"
        exit 2
esac

exit 0
