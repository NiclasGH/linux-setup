if [ -n "$ZSH" ] ; then
	echo "This script needs to be run from a zsh context"
	exit 1
fi

# Deactivate current plguin config
sed -i 's/plugins=(g/# plugins=(g/g' ~/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo 'plugins=(git colorize zsh-autosuggestions zsh-syntax-highlighting)' >> ~/.zshrc

echo 'source ~/.bash_device' >> ~/.zshrc
echo 'source ~/.bash_aliases' >> ~/.zshrc
echo 'source ~/.bash_functions' >> ~/.zshrc
