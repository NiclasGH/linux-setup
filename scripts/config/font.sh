#!/usr/bin/env bash

# JetBrains Mono
wget -O font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip font.zip -d fonts
sudo cp -f fonts/*.ttf /usr/share/fonts
rm -r fonts
rm font.zip

# Inter
wget -O font.zip https://github.com/rsms/inter/releases/download/v4.1/Inter-4.1.zip
unzip font.zip -d fonts
sudo cp -f fonts/*.ttf /usr/share/fonts
rm -r fonts
rm font.zip
