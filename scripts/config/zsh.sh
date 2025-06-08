#!/usr/bin/env bash

sudo dnf install -y zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
exec chsh -s $(which zsh)

echo 'source ~/.bash_device' >> ~/.zshrc
echo 'source ~/.bash_aliases' >> ~/.zshrc
echo 'source ~/.bash_functions' >> ~/.zshrc