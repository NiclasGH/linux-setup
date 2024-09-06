#!/bin/bash

ANSWER='N'
function ask_for() {
    read -n 1 -p "Install $1? [Y/N]: " ANSWER
}

# Detect the OS distribution
if [ -f /etc/arch-release ]; then
    DISTRO="arch"
elif [ -f /etc/lsb-release ]; then
    DISTRO="debian"
else
    DISTRO="unsupported"
fi

SCRIPTS=(essentials, java, rust, node, ssh_key, nvim, programs, aliases, gitlab, font, kde_eurokey)
# essentials and nvim contain multiple scripts

if [[ ! $ANSWER =~ ^[Yy]$ ]]; then
    # run script
fi

