#!/usr/bin/env bash

NON_ROOT_USER=$(id -un 1000)

sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
wget -O docker.rpm https://desktop.docker.com/linux/main/amd64/docker-desktop-x86_64.rpm?utm_source=docker
sudo dnf install -y ./docker.rpm
rm docker.rpm

systemctl enable docker.socket # Start ocker engine at startup
sudo gpasswd -a $NON_ROOT_USER docker # Allows non-root to use docker
