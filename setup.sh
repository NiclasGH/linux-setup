#!/bin/bash

# Step 1 ---- Run essentials -----
if [  -x ./setup_essentials.sh ]; then 
	./setup_essentials.sh
fi

# Step 2 ----- Configuration -----
git config --global user.name "Niclas Kürschner"
git config --global user.email "niclas.kuerschner@outlook.com"

echo "Generating ssh key..."
ssh-keygen -t ed25519

# Keyboard Layout on kde(This might need manual adjustment)
if [ $DESKTOP_SESSION -eq "plasma" ]; then
	echo "[Layout]" >> ~/.config/kxkbrc
	echo "LayoutList=eu" >> ~/.config/kxkbrc
	echo "ResetOldOptions=true" >> ~/.config/kxkbrc
	echo "Use=true" >> ~/.config/kxkbrc
fi # TODO ubuntu

wget -O font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip font.zip -d fonts
sudo cp -vf fonts/*.ttf /usr/share/fonts
rm -r fonts
rm font.zip

# Step 3 ----- User needs to manually add the SSH key -----
echo "Add the following key to: https://github.com/settings/keys to be able to continue"
cat /home/$NON_ROOT_USER/.ssh/id_ed25519.pub

read -n 1 -p "Confirm with Y to continue installation [Y/N]: " DO_GIT_INSTALL
if [[ ! $DO_GIT_INSTALL =~ ^[Yy]$ ]]; then
	echo "Finished base installation. Rest of installation was skipped"
	exit
fi

# Step 4 ----- Setup Aliases + Functions -----
git clone git@github.com:NiclasGH/linux-setup.git ~/linux-setup
cd ~/linux-setup
chmod +x pull.sh push.sh
./pull.sh

git clone git@github.com:NiclasGH/NeoVim-Configurations.git ~/.config/nvim

# End ----------
echo "Finished Installation - You can delete this script now"
echo "[1] You can install vim here: https://github.com/NiclasGH/NeoVim-Configurations"
