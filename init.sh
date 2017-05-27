#!/bin/sh

# source list
echo "add soure list"
rm /etc/apt/source.list.d/
ln -s ./source.list.d/ /etc/apt/source.list.d/
aptitude update
echo "finish all repo added"

# install zsh
echo "start installing zsh" 
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo "zsh install finished"

# install base package
echo "start install base package" 
aptitude install \
vim-nox \
vlc \
ranger \
i3wm \
gimp \

echo "finish base package install"



# make sure and remove old config
echo "start remove old config"
rm /home/sadegh/.zshrc
rm /home/sadegh/.zshenv

rm /home/sadegh/.bashrc
rm /home/sadegh/.bash_logout
rm /home/sadegh/.bash_profile
rm /home/sadegh/.profile
rm /home/sadegh/.xsession

rm -rf /home/sadegh/.config/.fonts

rm -rf /home/sadegh/.config/i3
rm -rf /home/sadegh/.config/ranger

rm /home/sadegh/.psqlrc

echo "old config removed"


# make symlink 
echo "start symlink"

echo "end symlink"
