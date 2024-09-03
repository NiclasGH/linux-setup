#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit 1
fi

# Step 1 ---- Run essentials -----
if [  -x ./setup_essentials.sh ]; then 
	./setup_essentials.sh
fi

NON_ROOT_USER=$(id -un 1000)
alias as-non-root-do='runuser -u $NON_ROOT_USER -- '

# Step 2 ----- Configuration -----
as-non-root-do git config --global user.name "Niclas Kürschner"
as-non-root-do git config --global user.email "niclas.kuerschner@outlook.com"

echo "Generating ssh key..."
as-non-root-do ssh-keygen -t ed25519

# Keyboard Layout on kde(This might need manual adjustment)
if [ $DESKTOP_SESSION -eq "plasma" ]; then
	as-non-root-do echo "[Layout]" >> ~/.config/kxkbrc
	as-non-root-do echo "LayoutList=eu" >> ~/.config/kxkbrc
	as-non-root-do echo "ResetOldOptions=true" >> ~/.config/kxkbrc
	as-non-root-do echo "Use=true" >> ~/.config/kxkbrc
fi # TODO ubuntu


# Step 3 ----- User needs to manually add the SSH key -----
echo "Add the following key to: https://github.com/settings/keys to be able to continue"
cat /home/$NON_ROOT_USER/.ssh/id_ed25519.pub

read -n 1 -p "Confirm with Y to continue installation [Y/N]: " DO_GIT_INSTALL
if [[ ! $DO_GIT_INSTALL =~ ^[Yy]$ ]]; then
	echo "Finished base installation. Rest of installation was skipped"
	exit
fi

# Step 4 ----- Setup Aliases + Functions -----
as-non-root-do git clone git@github.com:NiclasGH/linux-setup.git ~/linux-setup
as-non-root-do cd ~/linux-setup
chmod +x pull.sh push.sh
as-non-root-do ./pull.sh

# End ----------
echo "Finished Installation - You can delete this script now"
echo "[1] You can install vim here: https://github.com/NiclasGH/NeoVim-Configurations"
