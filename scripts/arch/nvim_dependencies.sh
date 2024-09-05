#!/bin/bash

# Idempotent

sudo pacman -S --noconfirm --needed gcc repgrep python-virtualenv xclip
cargo install tree-sitter-cli
