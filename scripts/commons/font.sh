#!/bin/bash

wget -O font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip font.zip -d fonts
sudo cp -f fonts/*.ttf /usr/share/fonts
rm -r fonts
rm font.zip
