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
username=$1;
password=$2;
if [ -f /home/$USER/.smbcredentials ]; then
   echo -en "\nERROR: /home/$USER/.smbcredentials already exists or was not able to be created\n"
else
 	echo  "username=${username}\npassword=${password}" > /home/$USER/.smbcredentials
    echo -en "\n/home/$USER/.smbcredentials was created successfully\n"
fi
wait 

# add FSTAB entry
ENTRY="//192.168.4.152/pool1 /mnt/media cifs uid=0,credentials=/home/$USER/.smbcredentials,iocharset=utf8,file_mode=0777,dir_mode=0777 0 0"

if grep -Fxq "$ENTRY" /etc/fstab
then
    echo -en "Entry already exists in fstab!"
else
    echo ${ENTRY} >> /etc/fstab
    echo -en "\n Added entry to fstab\n"
fi


# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
wait
