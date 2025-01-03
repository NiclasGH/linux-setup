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


DIRECTORY="linux-setup"

git config --global user.name "Niclas Kürschner"
git config --global user.email "niclas.kuerschner@outlook.com"

echo "Generating ssh key..."
ssh-keygen -t ed25519

echo ; echo "Add the following key to: https://github.com/settings/keys to be able to continue"
cat /home/$USER/.ssh/id_ed25519.pub

read -p "Press enter to continue"
git clone git@github.com:NiclasGH/linux-setup.git /home/$USER/$DIRECTORY

# Initalize aliases
(cd /home/$USER/linux-setup; ./pull.sh)
cp /home/$USER/$DIRECTORY/configuration/.bash_device /home/$USER/.bash_device
echo "source /home/$USER/.bash_device" >> /home/$USER/.bashrc
echo "source /home/$USER/.bash_functions" >> /home/$USER/.bashrc
echo "source /home/$USER/.bash_aliases" >> /home/$USER/.bashrc
echo "Aliases successfully configured"

echo ; echo "Initialization successful!"
