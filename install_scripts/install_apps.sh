#!/bin/sh 

#Script to install other apps not related for work reasons 

# Install discord

wget "https://discord.com/api/download?platform=linux&format=deb" -O /home/$SUDO_USER/Downloads/discord.deb 

dpkg -i /home/$SUDO_USER/Downloads/discord.deb

wait 


# Install spotify 


curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list


apt-get update 
wait
apt-get install spotify-client
