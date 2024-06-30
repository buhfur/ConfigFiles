#!/bin/sh

# copies the output from cat of  tmux.conf , bashrc , vimrc to the users dotfiles 

parent_dir=$(dirname $PWD)/dotfiles

# copy old dotfiles to /tmp/dotfilebackup

if [ -d /tmp/dotfilebackup ]; then
    mkdir /tmp/dotfilebackup
    #copy over current dotfiles to backup 
    #TODO : ls for dotfiles and pipe output into cp 


else
    mkdir /tmp/dotfilebackup 
    echo "Created /tmp/dotfilebackup , copying old dotfiles over "
    

fi

for filename in $parent_dir/*; do
    abs_path=${filename} #absolute path of dotfile 
    file_base=$(basename ${filename}) #basname
    dotfile="~/."${file_base} #conversion to dotfile format

    #cat ${abs_path} > ${dotfile}
    echo "${abs_path} > ${dotfile}"
done





