#!/bin/bash

# Idempotent

sudo pacman -S --noconfirm --needed gcc repgrep python-virtualenv xclip neovim
cargo install tree-sitter-cli
