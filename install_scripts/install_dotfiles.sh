#!/bin/bash


if [ $SHELL == /bin/zsh ]; then

    if [ -a $HOME/.zshenv ]; then
        echo ".zshrc is already present "
    else;
        cp ../dotfiles/aliases $HOME/.zshenv
    fi

elif [ $SHELL == /bin/bash]; then
    if [ -a $HOME/.aliases ]; then
        echo ".zshrc is already present "
    else;
        cp ../dotfiles/aliases $HOME/.aliases
    fi


fi


cat ../dotfiles/zshrc > ~/.zshrc 
cat ../dotfiles/bashrc > ~/.bashrc 
cat ../dotfiles/tmux.conf > ~/.tmux.conf
cat ../dotfiles/vimrc > ~/.vimrc
cat ../dotfiles/xinitrc > ~/.xinitrc




