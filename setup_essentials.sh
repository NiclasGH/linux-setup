#!/bin/bash

# Detect the OS distribution
if [ -f /etc/arch-release ]; then
	DISTRO="arch"
elif [ -f /etc/lsb-release ]; then
	DISTRO="debian"
else
	echo "Unsupported Linux distribution"
	exit 1
fi

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit 1
fi

NON_ROOT_USER=$(id -un 1000)
alias as-non-root-do='runuser -u $NON_ROOT_USER -- '

# Step 1 ----- Base Installations -----
if [ "$DISTRO" == "arch" ]; then
	pacman -Syu --noconfirm
	pacman -S --noconfirm --needed base-devel git

  # Programming Languages
  pacman -S --noconfirm --needed jre21-openjdk
elif [ "$DISTRO" == "debian" ]; then
	apt update && apt upgrade -y
	apt install -y build-essential git

  # Programming Languages
  apt install -y openjdk-21-jre
fi

# Rust
as-non-root-do curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Node (NVM)
as-non-root-do curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
as-non-root-do nvm install 20

# Step 2 ----- Programs & Tools -----
if [ "$DISTRO" == "arch" ]; then
	pacman -S --noconfirm --needed obsidian flameshot docker docker-compose # steam
	as-non-root-do systemctl docker.socker
	sudo gpasswd -a $NON_ROOT_USER docker # Allows user to run docker commands without root
	as-non-root-do yay -S --noconfirm --needed visual-studio-code-bin 1password spotify postman-bin docker-desktop vesktop

elif [ "$DISTRO" == "debian" ]; then
	apt install -y obsidian discord flameshot codium
	snap install spotify postman

  # 1Password (Debian/Ubuntu specific)
  curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
  echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
  mkdir -p /etc/debsig/policies/AC2D62742012EA22/
  curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
  mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
  curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
  apt update && apt install -y 1password

  # Docker Start (C&P from official docker documentation)
  apt-get -y install ca-certificates curl
  install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  chmod a+r /etc/apt/keyrings/docker.asc

  echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
	  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
	  tee /etc/apt/sources.list.d/docker.list > /dev/null
	    apt-get update && apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

	    wget -O docker.deb https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb
	    apt-get install ./docker.deb
	    rm -f docker.deb
	    # Docker End
fi

# JetBrains Toolbox
wget -O toolbox.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.4.2.32922.tar.gz
tar -xvf toolbox.tar.gz
TOOLBOX_DIR=$(find -name "*jetbrains*" -type d)
as-non-root-do $TOOLBOX_DIR/jetbrains-toolbox
rm -rf $TOOLBOX_DIR/jetbrains-toolbox
