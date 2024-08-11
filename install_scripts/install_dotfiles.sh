#!/bin/bash
if  [ $SHELL = /usr/bin/zsh ]; then
    cat ../dotfiles/zshrc > ~/.zshrc 
fi

cat ../dotfiles/bashrc > ~/.bashrc 
cat ../dotfiles/tmux.conf > ~/.tmux.conf
cat ../dotfiles/vimrc > ~/.vimrc
cat ../dotfiles/xinitrc > ~/.xinitrc




