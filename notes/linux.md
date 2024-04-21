
# Restore default .bashrc, .profile , or .bash\_logout

The default versions of these files are stored in 

`/etc/skel/`


**To restore these files**

`source /etc/skel/.bashrc`

or 

`source /etc/skel/.profile`

or 

`source /etc/skel/.bash_logout`


# Show motherboard info 

`dmidecode | less`


# Get CPU info 

`lscpu`

or 

`cat /proc/cpuinfo`


# Get disk info 

`lsblk -o +MODEL,SERIAL,WWN`

or 

`ls -l /dev/disk/by-id`

or 

`lsblk |awk 'NR==1{print $0" DEVICE-ID(S)"}NR>1{dev=$1;printf $0" ";system("find /dev/disk/by-id -lname \"*"dev"\" -printf \" %p\"");print "";}'|grep -v -E 'part|lvm'`
