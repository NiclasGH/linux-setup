#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

echo 'source ~/.bash_device' >> ~/.zshrc
echo 'source ~/.bash_aliases' >> ~/.zshrc
echo 'source ~/.bash_functions' >> ~/.zshrc