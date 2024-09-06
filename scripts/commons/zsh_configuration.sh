#!/bin/bash

chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

tee -a ~/.zshrc << END
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
END

tee -a ~/.zshrc << END
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
END

tee -a ~/.zshrc << END
if [ -f ~/.bash_device ]; then
    . ~/.bash_device
fi
END

