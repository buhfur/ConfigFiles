
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


