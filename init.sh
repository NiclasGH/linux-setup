#!/usr/bin/env bash

if [ "$USER" = "root" ] ; then
	echo "Don't run this script as root"
	exit 1
fi

if ! command -v git 2>&1 >/dev/null
then
    	echo "Git is not installed"
    	exit 1
fi

git config --global user.name "Niclas Kürschner"
git config --global user.email "niclas.kuerschner@outlook.com"

echo "Generating ssh key..."
ssh-keygen -t ed25519

echo ; echo "Add the following key to: https://github.com/settings/keys to be able to continue"
cat ~/.ssh/id_ed25519.pub

read -p "Press enter to continue"
git clone git@github.com:NiclasGH/linux-setup.git ~/linux-setup

# Initalize aliases
git clone git@github.com:NiclasGH/shell-configuration.git ~/shell-configuration
(cd ~/shell-configuration; ./init.sh)
echo "Aliases successfully configured"

echo ; echo "Initialization successful!"
