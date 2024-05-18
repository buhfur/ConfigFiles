#!/bin/bash
# Description: Script to install optional packages on a debian based distribution 

# create the media directory 
if [ ! -d /mnt/media ]; then
	mkdir /mnt/media
  echo -en "/mnt/media directory created"
else
        echo -en "\nERROR: /mnt/media already exists";
fi
wait 

# add credentials file 
username="jellyfin";
password="youronyourown";
if [ -f /home/$SUDO_USER/.smbcredentials ]; then
   echo -en "\nERROR: /home/$SUDO_USER/.smbcredentials already exists or was not able to be created\n"
else
 	echo  "username=${username}\npassword=${password}" > /home/$SUDO_USER/.smbcredentials
    echo -en "\n/home/$SUDO_USER/.smbcredentials was created successfully\n"
fi
wait 

# add FSTAB entry
ENTRY="//192.168.4.152/pool1 /mnt/media cifs uid=0,credentials=/home/$SUDO_USER/.smbcredentials,iocharset=utf8,file_mode=0777,dir_mode=0777 0 0"

if grep -Fxq "$ENTRY" /etc/fstab
then
    echo -en "Entry already exists in fstab!"
else
    echo ${ENTRY} >> /etc/fstab
    echo -en "\n Added entry to fstab\n"
fi

# Install protonvpn cli and input creds in prompted login 
git clone https://github.com/ProtonVPN/linux-cli-community /home/$SUDO_USER/linux-cli
wait
cd /home/$SUDO_USER/linux-cli
wait
pip3 install -e . --break-system-packages


# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
wait
