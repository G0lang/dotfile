#!/bin/sh

yay -S mbpfan-git
sudo systemctl enable mbpfan.service
sudo systemctl start mbpfan.service
sudo systemctl status mbpfan.service
