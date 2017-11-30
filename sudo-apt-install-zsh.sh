#!/bin/bash

sudo apt-get install zsh

mkdir -p ~/.zsh
cd ~/.zsh
git clone https://github.com/olivierverdier/zsh-git-prompt.git git-prompt

echo "Creating .zshrc file"
cat > ~/.zshrc <<EOL
autoload -U compinit promptinit
compinit
promptinit

source /home/$USER/.zsh/git-prompt/zshrc.sh
PROMPT='
%{\$fg[green]%}%n@%m%{\$reset_color%} %{\$fg[yellow]%}%~%{\$reset_color%} \$(git_super_status)
\$ '
EOL

# make zsh default shell
chsh -s $(which zsh)

# root user still doesn't use zsh, it should be enabled manually
# but now just link zsh prefs just in case
sudo ln -s "/home/$USER/.zshrc" /root/.zshrc

# test it
zsh
