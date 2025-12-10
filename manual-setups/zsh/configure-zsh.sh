# Deactivate current plguin config
sed -i 's/plugins=(g/# plugins=(g/g' ~/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo dnf install fzf -y

echo 'plugins=(git colorize zsh-autosuggestions zsh-syntax-highlighting)' >> ~/.zshrc

echo 'source <(fzf --zsh)' >> ~/.zshrc

echo 'source ~/.bash_device' >> ~/.zshrc
echo 'source ~/.bash_aliases' >> ~/.zshrc
echo 'source ~/.bash_functions' >> ~/.zshrc
