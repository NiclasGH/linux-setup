#!/bin/bash

# Idempotent

sudo pacman -S --noconfirm --needed gcc repgrep python-virtualenv
cargo install tree-sitter-cli
