#!/bin/bash

# Script to copy rice config files 
cp -r .vimrc > ~/dotfiles/vimrc 
cp -r .tmux.conf > ~/dotfiles/tmux.conf
cp -r .zshrc > ~/dotfiles/zshrc 
cp -r .zshenv > ~/dotfiles/zshenv  
cp -r .config/picom/* ~/dotfiles/picom/
cp -r .config/polybar/* ~/.dotfiles
cp -r .config/i3/* ~/dotfiles/i3/
cp -r .oh-my-zsh/* ~/dotfiles/oh-my-zsh/


