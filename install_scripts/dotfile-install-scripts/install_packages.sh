#!/bin/bash
# Install packages from package list 
apt-get -y install $(cat /home/$SUDO_USER/buhfur.github.io/install_scripts/package_lists/debian_packages)


