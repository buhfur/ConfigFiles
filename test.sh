#!/bin/bash
#
# script that iterates through all subdirs in macros/ and adds links to files in the subdirs in one specified file 


for x in $PWD/macros/*; do 
    FILENAME=$(basename $x).md
    echo $x
    touch $PWD/macros/$FILENAME ; echo "created $PWD/macros/$FILENAME"
    tocgen -d $x -f $PWD/macros/$FILENAME
done
