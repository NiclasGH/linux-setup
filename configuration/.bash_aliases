# Managed by script. 
# Please keep this in sync using pull.sh before and push after making changes
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

alias kc='kubectl'
complete -o default -F __start_kubectl kc

# Bash config
alias editsh='vim ~/.bashrc'
alias editzsh='vim ~/.zshrc'

# Alias
alias aliases='cat ~/.bash_aliases && echo && cat ~/.bash_device'
alias editaliases='vim ~/.bash_aliases'
alias editdevice='vim ~/.bash_device'
