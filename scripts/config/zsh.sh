#!/usr/bin/env bash

sudo dnf install -y zsh fzf

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
exec chsh -s $(which zsh)
