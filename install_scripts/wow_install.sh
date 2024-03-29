#!/bin/bash
#
#
#Installs wine , adds 32 bit architecture , installs turtle wow

apt-install $(cat packages)

wait 

# Add 32bit architecture 

dpkg --add-architecture i386
wait

# Install turtle wow & Addons in the home directory 
wget https://turtle-eu.b-cdn.net/twmoa_1171.zip -P /home/`users`
# Unzip the twmoa_1171 zip archive 
unzip /home/`users`/twmoa_1171.zip 
wait 

# Instal addons 
wget -i addons -P /tmp/Addons
wait
# Unzip addons
unzip /tmp/Addons/"*.zip" -d /tmp/Addons
wait 
# remove the zip archives 
find /tmp/Addons -maxdepth 1 -type f -name "*.zip" -delete
find /tmp/Addons -maxdepth 1 -type f -name "*.zip.*" -delete




