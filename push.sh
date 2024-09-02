git reset --hard
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
git commit -m "Alias and Function update"
git push
