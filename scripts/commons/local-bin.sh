#!/bin/bash

mkdir -p ~/.local/bin
echo "for d in ~/.local/bin; do PATH="$d:$PATH"; done" >> ~/.bashrc
