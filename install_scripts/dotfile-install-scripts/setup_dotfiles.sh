#!/bin/sh



git clone --bare https://github.com/buhfur/dotfiles $HOME/.dotfiles

case $SHELL in 

    /bin/bash ) 
        echo "User is using Bash "
        echo "alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'" >> ~/.bashrc

        source $HOME/.bashrc
        ;;

    /bin/zsh )
        echo "User is using Zsh "
        echo "alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'" >> ~/.zshrc
        source $HOME/.zshrc
        ;;

esac



dotfiles checkout
dotfiles config --local status.showUntrackedFiles no


