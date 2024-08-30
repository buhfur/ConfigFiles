#!/bin/bash

# Script to copy rice config files 
cp -r $HOME/.vimrc ~/i3-rice/vimrc 
cp -r $HOME/rofi/* ~/i3-rice/rofi
cp -r $HOME/.tmux.conf ~/i3-rice/tmux.conf
cp -r $HOME/.zshrc ~/i3-rice/zshrc 
cp -r $HOME/.zshenv ~/i3-rice/zshenv  
cp -r $HOME/.config/picom/* ~/i3-rice/picom/
cp -r $HOME/.config/polybar/* ~/i3-rice/polybar/
cp -r $HOME/.config/i3/* ~/i3-rice/i3/
cp -r $HOME/.oh-my-zsh/* ~/i3-rice/oh-my-zsh/


