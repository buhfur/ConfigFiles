#!/bin/bash

#NOTE: YOU MUST BE ROOT TO RUN THIS SCRIPT 

if [ $SHELL == /bin/zsh ]; then

    if ! [ -a $HOME/.zshenv ]; then
        cp aliases $HOME/.zshenv
    fi

else
    if ! [ -a $HOME/.aliases ]; then
        cp aliases $HOME/.aliases
    fi
fi

#Check if oh-my-zsh is installed 
if ! [[ -a $HOME/.oh-my-zsh/oh-my-zsh.sh ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

#Install fonts 
echo "Would you like to install the Iosevka font ? "

if ! [[ -a /usr/share/fonts ]]; then
    mkdir /usr/share/fonts
fi

read response 
if [[ "$response" == [yY] ]]; then
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Iosevka.tar.xz -P /tmp/ && sudo tar xvf /tmp/Iosevka.tar.xz -C /usr/share/fonts/
    echo "Iosevka font was installed"
fi


cat zshrc > ~/.zshrc 
cat bashrc > ~/.bashrc 
cat tmux.conf > ~/.tmux.conf
cat vimrc > ~/.vimrc

#copy ohmyzsh config
cp -r oh-my-zsh $HOME/.oh-my-zsh




