
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


# Reduce text entering sensitivity 

You can either use kbdrate or xset , preferably xset as it works alot easier 

Enter this line in your xinitrc , or just copy the xinitrc from the ~/dotfiles directory to your local .xinitrc

`xset r rate 250 60`


This will reduce the sensitivity 


# xinitrc 

the xinitrc file is used for loading additional configurations and settings when the Xorg server starts 


# Manually disable the caps lock ( lock , not the button itself) 

**Install numlockx and run this command**

`python -c 'from ctypes import *; X11 = cdll.LoadLibrary("libX11.so.6"); display = X11.XOpenDisplay(None); X11.XkbLockModifiers(display, c_uint(0x0100), c_uint(2), c_uint(0)); X11.XCloseDisplay(display)'`


# Add aliases for ssh connections 

Add two lines for each host , one being the IP and the port you want to use 

`vim ~/.ssh/config `

Add these two lines 

```
Host xxx.xxx.x.x
Port xxx

```

# Create swap file 

**step 1 : use dd to create the file using the /dev/zero device**

`dd if=/dev/zero of=/swapfile bs=1M count=100`

**step 2 : convert file to swapfile**

`mkswap /swapfile`

**step 3 : swap to the newly created swap file**

`swapon /swapfile`

**step 4 : mount the file in /etc/fstab**

Add this line to the bottom of your /etc/fstab file 

`/swapfile none swap defaults 0 0`

This will mount the swap file automatically after boot 



# Enable ssh port in SELinux 


`semanage port -a -t ssh_port_t -p tcp PORTNUMBER `



