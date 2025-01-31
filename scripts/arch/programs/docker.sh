#!/bin/bash

NON_ROOT_USER=$(id -un 1000)

sudo pacman -S --noconfirm --needed docker docker-compose
systemctl enable docker.socket
sudo gpasswd -a $NON_ROOT_USER docker # Allows user to run docker commands without root
yay -S --noconfirm --needed docker-desktop

