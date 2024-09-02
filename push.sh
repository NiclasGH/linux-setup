git reset --hard
git pull


if [ ! -f ~/.bash_aliases ]; then
    touch ~/.bash_aliases
fi
rm configuration/.bash_aliases
cp ~/.bash_aliases configuration/.bash_aliases

if [ ! -f ~/.bash_functions ]; then
    touch ~/.bash_functions
fi
rm configuration/.bash_functions
cp ~/.bash_functions configuration/.bash_functions

git add .
git commit -m "Alias and Function update"
git push
