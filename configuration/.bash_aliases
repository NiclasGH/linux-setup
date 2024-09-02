# Core
alias ll='ls -alF'
alias gitm='git commit -m'
alias gita='git add .'
alias gitpullf='git reset --hard && git fetch && git pull'
alias gitpull='git stash && git fetch && git pull && git stash pop'
alias cleanbuild='./gradlew clean codegen build -x check test contractTest'
alias testall='./gradlew test integrationTest contractTest'
alias vim='nvim'
alias q='exit'
alias search='ls | grep'
alias editvim='vim ~/.config/nvim'
alias tovim='cd ~/.config/nvim'
alias so='source ~/.bashrc'

# Alias
alias aliases='cat ~/.bash_aliases'
alias editaliases='vim ~/.bash_aliases'
