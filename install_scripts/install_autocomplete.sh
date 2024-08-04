#!/bin/sh
#

INSTALL_DIR=~/zsh-autocomplete
git clone --depth 2 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/zsh-autocomplete

echo -n "add this line to your ~/.zshrc : \n\tsource $INSTALL_DIR"
