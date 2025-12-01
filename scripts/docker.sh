#!/usr/bin/env bash

NON_ROOT_USER=$(id -un 1000)

# install docker
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
wget -O docker.rpm https://desktop.docker.com/linux/main/amd64/docker-desktop-x86_64.rpm?utm_source=docker
sudo dnf install -y ./docker.rpm
rm docker.rpm

# install dive
DIVE_VERSION=$(curl -sL "https://api.github.com/repos/wagoodman/dive/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
curl -fOL "https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.rpm"
sudo dnf install -y ./dive_${DIVE_VERSION}_linux_amd64.rpm

systemctl enable docker.socket # Start docker engine at startup
sudo gpasswd -a $NON_ROOT_USER docker # Allows non-root to use docker
