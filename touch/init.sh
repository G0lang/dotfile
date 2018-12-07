#!/bin/sh

ln -s $PWD/.Xmodmap $HOME/.Xmodmap

sudo ln -s $PWD/60-mtrack.conf /etc/X11/xorg.conf.d/60-mtrack.conf

sudo gpasswd -a $USER input
