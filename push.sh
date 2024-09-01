git reset --hard
git pull

rm configuration/.bash_aliases
cp ~/.bash_aliases configuration/.bash_aliases

rm configuration/.bash_functions
cp ~/.bash_functions configuration/.bash_functions

git commit -m "Alias and Function update"
git push
