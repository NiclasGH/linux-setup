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
  pacman -S --noconfirm jre21-openjdk
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

# Step 2 ----- Configuration -----
as-non-root-do git config --global user.name "Niclas Kürschner"
as-non-root-do git config --global user.email "niclas.kuerschner@outlook.com"

echo "Generating ssh key..."
as-non-root-do ssh-keygen -t ed25519

# Keyboard Layout (This might need manual adjustment)
as-non-root-do setxkbmap eu

# Step 3 ----- Programs & Tools -----
if [ "$DISTRO" == "arch" ]; then
  pacman -S --noconfirm obsidian discord flameshot # steam
  as-non-root-do yay -S --noconfirm visual-studio-code-bin 1password
elif [ "$DISTRO" == "debian" ]; then
  apt install -y obsidian discord flameshot codium

  # 1Password (Debian/Ubuntu specific)
  curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
  echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
  mkdir -p /etc/debsig/policies/AC2D62742012EA22/
  curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
  mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
  curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
  apt update && apt install -y 1password
fi

# JetBrains Toolbox
wget -O toolbox.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.4.2.32922.tar.gz
tar -xvf toolbox.tar.gz
TOOLBOX_DIR=$(find -name "*jetbrains*" -type d)
as-non-root-do $TOOLBOX_DIR/jetbrains-toolbox

# Step 4 ----- User needs to manually add the SSH key -----
echo "Add the following key to: https://github.com/settings/keys to be able to continue"
cat /home/$NON_ROOT_USER/.ssh/id_ed25519.pub

read -n 1 -p "Confirm with Y to continue installation [Y/N]: " DO_GIT_INSTALL
if [[ ! $DO_GIT_INSTALL =~ ^[Yy]$ ]]; then
  echo "Finished base installation. Rest of installation was skipped"
  exit
fi

# Step 5 ----- Setup Aliases + Functions -----
as-non-root-do git clone git@github.com:NiclasGH/linux-setup.git ~/linux-setup
as-non-root-do cd ~/linux-setup
chmod +x pull.sh push.sh
as-non-root-do ./pull.sh

# End ----------
echo "Finished Installation - You can delete this script now"
echo "[1] You can install vim here: https://github.com/NiclasGH/NeoVim-Configurations"
