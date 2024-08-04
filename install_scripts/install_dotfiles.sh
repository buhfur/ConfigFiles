#!/bin/sh
# copies the output from cat of  tmux.conf , bashrc , vimrc to the users dotfiles 

# delete bash history for security reasons 
if [ -f $HOME/.bash_history ] ;
    rm $HOME/.bash_history 
    echo "| rm $HOME/.bash_history"
fi

echo -e "| removed .bash_history\n"

# Copy existing dotfiles to /tmp 
for x in $(find . -maxdepth 1 -type f -name ".*" | grep -E 'tmux|vim|bash|xinitrc'); do
    cp $x /tmp
    echo "| cp $x /tmp"


# Copy new dotfiles to $HOME
for x in ../dotfiles/* ; do
    echo "| cat $x > ~/.$(basename ${x})"
done



