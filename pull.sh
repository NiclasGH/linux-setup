#!/bin/bash

git reset --hard && git pull

if [ -f ~/.bash_aliases ]; then
    rm ~/.bash_aliases
fi
cp ./configuration/.bash_aliases ~/.bash_aliases 

if [ -f ~/.bash_functions ]; then
    rm ~/.bash_functions
fi
cp ./configuration/.bash_functions ~/.bash_functions

