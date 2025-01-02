#!/usr/bin/env bash

if [[ `git status --porcelain` ]]; then
  echo "There are changes. Please review and commit them before pushing"
  exit 1
fi

git pull

if [ -f ~/.bash_aliases ]; then
    rm configuration/.bash_aliases
    cp ~/.bash_aliases configuration/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    rm configuration/.bash_functions
    cp ~/.bash_functions configuration/.bash_functions
fi

git add .
git commit -m "[script] aliases update"
git push

echo "Pushed aliases"
