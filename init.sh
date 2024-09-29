#!/bin/bash

git config --global user.name "Niclas Kürschner"
git config --global user.email "niclas.kuerschner@outlook.com"

NON_ROOT_USER=$(id -un 1000)

echo "Generating ssh key..."
ssh-keygen -t ed25519

echo "Add the following key to: https://github.com/settings/keys to be able to continue"
cat /home/$NON_ROOT_USER/.ssh/id_ed25519.pub
