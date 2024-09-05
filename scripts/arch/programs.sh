#!/bin/bash

NON_ROOT_USER=$(id -un 1000)

sudo pacman -S --noconfirm --needed obsidian flameshot docker docker-compose
systemctl docker.socket
sudo gpasswd -a $NON_ROOT_USER docker # Allows user to run docker commands without root

yay -S --noconfirm --needed visual-studio-code-bin 1password spotify postman-bin docker-desktop vesktop

wget -O toolbox.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.4.2.32922.tar.gz
tar -xvf toolbox.tar.gz
TOOLBOX_DIR=$(find -name "*jetbrains*" -type d)
$TOOLBOX_DIR/jetbrains-toolbox
rm -rf $TOOLBOX_DIR/jetbrains-toolbox
