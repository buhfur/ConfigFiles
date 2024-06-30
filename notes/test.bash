#!/bin/bash 


# conditionals in bash 

# Check if something is a file 

FILE_PATH="/home/ryan/config/notes/linux.md"
DIR_PATH="/home/ryan/config/notes"


if [ -f $FILE_PATH ]; then 
    echo $FILE_PATH is a file 

elif [-d $DIR_PATH ]; then 
    echo "$DIR_PATH is a directory"

fi
