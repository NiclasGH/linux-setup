if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

pacman -Syu --noconfirm

# Base
pacman -S --noconfirm --needed base-devel git

# Git
git config --global user.name "Niclas Kuerschner"
git config --global user.email "niclas.kuerschner@outlook.com"

# EurKey
setxkbmap eu

# Programming Languages
pacman -S --noconfirm jre21-openjdk

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
nvm install 20

# Everyday programs
pacman -S --noconfirm obsidian discord flameshot # steam

wget -O toolbox.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.4.2.32922.tar.gz
tar -xvf toolbox.tar.gz
TOOLBOX_DIR=$(find -name "*jetbrains*" -type d)
$TOOLBOX_DIR/jetbrains-toolbox # Execute

# Non-root tasks
su - $(id -un 1000) # Switch to user with id 1000
yay -S --noconfirm visual-studio-code-bin 1password
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y # Rust

echo "Generating ssh key..."
ssh-keygen -t ed25519

# Post information
echo "[1] Add the following key to: https://github.com/settings/keys"
cat ~/.ssh/id_ed25519.pub
echo # Empty line
echo "[2] You can install vim here: https://github.com/NiclasGH/NeoVim-Configurations"
echo "[3] It is recommended to run the [pull.sh] command after setting the ssh key and pulling the repository"
