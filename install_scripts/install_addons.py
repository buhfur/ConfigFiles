#!/usr/bin/env python3 
import os
import sys
'''Reads Addon directory , if the name of the TOC file doesn't match the name of the parent folder , they are changed
to match
'''
def read_folder(path):
    # Open TOC file 
    path = os.path.split(path)
    print(path) 



if __name__ == '__main__':

    # Read folder full of directories 
    print(os.listdir("/home/torrent-user/config/"))
