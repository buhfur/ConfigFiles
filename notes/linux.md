
# Linux notes for reference

In this document I have added various bash snippets ,tips , and other useful pieces of knowledge that might help me navigate the insane POWAH of linux.


# Command snippets 

Below are some snippets of various commands and what they do. 

## Restore default .bashrc, .profile , or .bash\_logout

The default versions of these files are stored in 

`/etc/skel/`


**To restore these files**

`source /etc/skel/.bashrc`

or 

`source /etc/skel/.profile`

or 

`source /etc/skel/.bash_logout`


## Show motherboard info 

`dmidecode | less`


## Get CPU info 

`lscpu`

or 

`cat /proc/cpuinfo`


## Get disk info 

`lsblk -o +MODEL,SERIAL,WWN`

or 

`ls -l /dev/disk/by-id`

or 

`lsblk |awk 'NR==1{print $0" DEVICE-ID(S)"}NR>1{dev=$1;printf $0" ";system("find /dev/disk/by-id -lname \"*"dev"\" -printf \" %p\"");print "";}'|grep -v -E 'part|lvm'`


## Reduce text entering sensitivity 

You can either use kbdrate or xset , preferably xset as it works alot easier 

Enter this line in your xinitrc , or just copy the xinitrc from the ~/dotfiles directory to your local .xinitrc

`xset r rate 250 60`


This will reduce the sensitivity 


## xinitrc 

the xinitrc file is used for loading additional configurations and settings when the Xorg server starts 


## Manually disable the caps lock ( lock , not the button itself) 

**Install numlockx and run this command**

`python -c 'from ctypes import *; X11 = cdll.LoadLibrary("libX11.so.6"); display = X11.XOpenDisplay(None); X11.XkbLockModifiers(display, c_uint(0x0100), c_uint(2), c_uint(0)); X11.XCloseDisplay(display)'`


## Add aliases for ssh connections 

Add two lines for each host , one being the IP and the port you want to use 

`vim ~/.ssh/config `

Add these two lines to the ~/.ssh/config file 

> Host xxx.xxx.x.x
> Port xxx


## Create swap file 

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



## Archive top level directories with tar 

Use the '-C / xxx/xxx'

For example if you want to archive the /etc/network/interfaces file 

`sudo tar czf interfaces.tar -C / etc/network/interfaces`

# Tips & tricks 

Below is some useful info for different services and how they can be enabled / modified.

## Installing Network Manager on Debian 12 

One of the issues while installing NetworkManager lies with a preset network configuration by the system. Specifically the file /etc/network/interfaces is configured automatically and for some reason if this is present you will see an error in STDERR when installing asking you to remove the configuration if you want to use Network manager to manage any connections.


Simply delete all lines in /etc/network/interfaces and re-install the package and the systemd service file should be present and should allow you  to activate it. 

## ProtonVPN connections 

Change the file extension to a .conf file , then copy the file over to /etc/openvpn. This will start a daemon for every connection in the directory 

## Setting up torrent server vm 

Put ovpn file in /etc/openvpn 

install openvpn-systemd-resolved and network manager

## Redirect both STDOUT and STDERR 

`command &> /dev/null`

or 

`command > /dev/null 2>&1`


## Piping 

0> = STDIN
1> = STDOUT 
&> = STDOUT & STDERR
2> = STDERR


## add timestamp to tar archive 

`tar -zcvf "$(date '+%Y-%m-%d').tar.gz" `


## tar snippets 

**List contents of archive**

`tar -tf archive.tar`

**Add file to archive**

`tar -rf backup.tar file`

**Backup entire system with timestamp**

Note : it's a good idea to exclude sys, mnt , and proc as they can cause a backup to freeze. None of these directories should be necessary for archival anyways 

`tar pzvxf --exclude=mnt/ --exclude=sys/ --exclude=proc/ /backup/"$(date '+%Y-%m-%d').tar.gz" --one-file-system /`

## restore backup from tar archive 

`tar --overwrite -xzvf backup.tar.gz --directory /`


## Start command as background job 

`command &`

Add an ampersand at the end of the command 

Type jobs to view your background tasks

use `fg ` by itself to bring the most recently started background job to the foreground of the console. From there you can stop the job using Ctrl-Z or Ctrl-C

## List largest files in current directory 

`du . | sort -nr | head -n10`

## List largest directories in current directory 

`du -s * | sort -nr | head -n10`


## Change file extension of all files in directory

`rename 's/\.foo$/.bar/' *.foo`

replace foo with the current extension , replace bar with the new ext.


## To boot into diff target

`cd /usr/lib/systemd/system`

`grep Isolate *.target`

Decide which target you would like to use , then run systemctl isolate 

`systemctl isolate something.target`


## xrandr 

Put xrandr configurations in ~/.xprofile 



### move monitor to the right of another 

`xrandr --output <DISPLAY-OUTPUT-1> --right-of <DISPLAY-TWO-2> `


### change refresh rate of monitor 

`xrandr --output <DISPLAY-OUTPUT> --mode <DISPLAY-RESOLUTION> --rate <REF-RATE> `

Put this line in the ~/.xprofile file for configuration on startup ( happens late in the boot process ) 



## Change background picture with feh 

create a ~/.fehbg file with your feh command 

`feh --bg-fill /home/user/something.jpg`

Then put this line in your ~/.xinitrc file 

`~/.fehbg &`


## Enable CIFS mounts for user 

Set the SUID perm on these binaries 

> /bin/mount
> /bin/umount 
> /user/sbin/mount.cifs

`sudo chmod u+s /bin/mount /bin/umount /usr/sbin/mount.cifs`

## Scan for all IP's on your network with nmap

`nmap -sn 192.168.0.0/24`

You can substitute the ip in the command above for one or multiple networks 

The '-sn' option tells nmap to not search for open ports 


## Check what port a service is using 

**If you know the port the service might be using**

`lsof -i :<port>`


**If you don't know the port being used**



## bash difference between $() and ${}

"${}" :
- used for referencing variables in a script 

`echo ${var} something`

"$()" : 
- used for running commands in a subshell 

`echo "Path $(basename /home/user/Downloads)`


## use find to only list dotfiles 

`find . -maxdepth 1 -type f -name ".*" `


## Change extensions of all files in dir

`find . -name '*.txt' -exec sh -c 'mv "$0" "${0%.txt}.txt_bak"' {} \;`

Replace .txt with the current ext and replace .txt_bak with the ext you are trying to set it to 


## add text to specific line with sed 

For this example I wanted to update a bunch of openvpn config files to change only one line , being the 'auth-user-pass' and put in the location where my creds are stored 

Below is the command I used 

`sed -e '/auth-user-pass/ s/$/ \/opt\/scripts\/login.conf/' ./*`


# nmcli 

## Create new network connection in nmcli 

`nmcli con add con-name static ifname ens18 autoconnect no type ethernet ip4 10.0.0.10/24 gw4 10.0.0.1 ipv4.method manual`


## Bring up network connection with nmcli 

`nmcli con up <con-name> `


## Switch to DHCP with nmcli 

`nmcli con up dhcp`


## change connection to not connect automatically with nmcli 

`nmcli con mod <con-name> connection.autoconnect no`

## Add DNS server to connection with nmcli 

`nmcli con mod <con-name> ipv4.dns <dns-server-ip>`

**To add additional dns servers**

`nmcli con mod <con-name> +ipv4.dns 8.8.8.8`

## Change IP for existing connection in nmcli 

`nmcli con mod <con-name> ipv4.addresses <ip-address>/<CIDR-prefix>`

## Add secondary IP addresses with nmcli 

`nmcli con mod <con-name> +ipv4.addresses <new-ip>/<CIDR-prefix>`

## After chaning any properties to a connection you must re-activate the connection 

`nmcli con up <con-name> `

---

# SELinux 

## Put SElinux into disabled mode in grub 

Put this line into your kernel boot args 

`selinux=0`

## Put Selinux into enforcing mode in grub

add this to kernel boot args 

`enforcing=0`

## View selinux config

`cat /etc/sysconfig/selinux`

## Check what mode selinux is running 

`getenforce`

## Switch between selinux modes temporarily 

**permissive mode**

`setenforce 0`

**enforcingm mode**

`setenforce 1`

## Switch modes persistantly

modify /etc/sysconfig or add kernel boot arg 

## Get status of selinux 

`sestatus`

**Get more detailed info**

`setstatus -v`

## Show context setttings 

**using ls**

`ls -Z`

**using ps**

`ps Zaux`

**using ss**

`ss -Ztul`

## Setting Context types 

**Add context type to manually created directories**

`semanage fcontext -a -t <contxt-type> "/mydir"`

**Apply policy settings**

`restorecon -R -v /mydir`

**Help with setting contexts**

`man semanage-fcontext`

type "/example"

## Finding context types 

Install selinux-policy-doc package 

`dnf -y install selinux-policy-package`

`man -k _selinux`

## Enable ssh port in SELinux 

`semanage port -a -t ssh_port_t -p tcp PORTNUMBER `

## Relabel entire filesytem 

`restorecon -Rv /`

or create a file `/.autorelabel`
works after server restart, afterwards the file will be removed

## Managing Port Access 

**Example: Changing port of apache**

`semanage port -a -t http_port_t -p tcp 8008`

**Template**

`semanage port -a -t <context-type> -p <tcp/udp> <port>`

run `restorecon` afterwards to apply changes


## Using Boolean Settings to Modify SELinux Settings

**get list of booleans on system**

`getsebool -a`

`semanage boolean -l`

**Change Boolean example**

`setsebool ftpd_anon_write on`

**Template**

`setsebool <context-rule> <on/off>`

**Apply permanant changes to boolean**

`setsebool -P`

## Key topics about selinux 

- newly created files inherit the context settings from the parent directory
- copied files do this as well. 
- original context settings are retained when using the `cp -a` command. To fix this use `restorecon`

# DNF 

## Search for RPM's of specific tool

`dnf whatprovides */semanage`

`dnf whatprovides`
