
# Notes about RHCSA 



# Mananging disks

In this chapter , which I accidentally deleted by accident....fucking fat fingered my vim keybinds. Anywho... This is how you can manage disks on RHEL 9 ! 


# Step one : Finding out which type of disk parition you would like to use 

There's two types of partitions you can make , the first being an MBR partition table. 


## MBR 

MBR stands for Master Boot Record. It's an old partitioning scheme from the 80's which was meant to be read by your BIOS and loaded. This would allow you to actually boot your computer ! Withtin the Master Boot Record is a bootloader and a partition table. The bootloader for your computer by the way is the first 512 bytes of code that loads your OS( kernel ) into memory.


You can create an MBR partitioning table by using fdisk. Run the command and select your disk 

**Example** 

`$ fdisk /dev/sdx`

Side note : replace /dev/sdx with the name of your device 

in the options , select  "p" for primary partition , use the default first sector , enter +1G for a one gibibyte partition 

You can change the type of partition by using the "t" option , by default the parititon type is set to Linux 

Once you are done , write your changes to disk with "w".

You can add extensible partitions which can contain logical partitions which can then be used to create filesystems on them. You cannot create a filesystem on an extensible partition on it's own ! 


To do this do the following : 

Use the "n" option to create a new partition. 

Then use the "e" option to create an extensible partition. 



# Advanced troubleshooting 

Here below I will put some notes while studying the following chapters to see if I retain any info I jot down here. 


I'm going to edit the grub2 config to increase the timeout so I can access it for longer periods of time. 

I've opened up another vm for learning about troubleshooting grub 2. You can modify some of the options during boot. Press 'e' to view the command line args that will be passed to your system at boot. 

Here are some options you can add to the command args and what they do: 

rd.break = stops boot procedure in the initramfs stage. This also means that the root filesystem is not mounted yet. 

init=/bin/sh or init=/bin/bash -> specifies that the shell should be started after loading the kernel and initd. Provides earliest possible access to a running system.  Only the root fs is mounted and it's mounted as read-only 



# Rescue disk 

If you are unable to boot from disk , you will more than likely see a blinking cursor. If not , regardless you should be able to use a rescue disk. The rescue disk is apart of the installation disk that comes with RHEL. 

If you can't boot from GRUB , try the "Boot from a Local Drive" option which allows you to boot your machine using a bootloader that is installed to disk 

When using the Rescue a Red Hat Entrpriese Linux system , the distro should detect your other installation of RHEL. From there you will be able to access the filesystem your distro is installed on /mnt/sysimage. 

from there you can chroot to the filesystem in /mnt/sysimage 

`chroot /mnt/sysimage`

Once you are in the root directory of the rescue disk , you can re-install grub2 if you need to. To do this run the following commands below 

`grub2-install /dev/sdx`

If you're initramfs is broken , you can use dracut to fix it. This command creates a new initramfs for the currently loaded kernel. 

config files for dracuc are stored in /etc/dracut.conf.d

You can tell if the initramfs is messed up since the root filesystem will never be mounted. Nor will you see any systemd units started. To fix it using dracut 

just run the following command: 

`dracut --force ` 

If there's something wrong with the fstab file and you need to access the filesystem( in the event you can't for some reason ) you can use the command below to remount the root filesystem 

`mount -o remount,rw /`

This remounts the root fs with the 'rw' and the 'remount' mount options. 


# Resetting / forgetting the root password 

1. Start system with init=/bin/bash arg in grub boot menu command line. 

2. `mount -o remount,rw / `

3. `passwd root`

4. `exec /usr/lib/systemd/systemd` 

And that is how you can change the root password 

IF systemd is not started , you can use a similar command to step 4 

`exec /usr/lib/sytemd/system`


# Bash scripting 


Arguments used in bash scripts can be referenced by a $1-9 character 

For example , if you have a script something.bash name1 name2

Name1 would be $1 and name2 would be $2 

"$#" represents the number of arguments you have entered 
"$@" refers to all arguments used when starting the script.

You can use the "read" command to query the user for input 

To add a timestamp to something , you can use the following command 
and add it to a variable 

TODAY=$(date +%d-%m-%y)

Most of the syntax for bash scripting is straight forward , with the added exception of the until statement , which acts like a do while loop 

Note : don't use spaces in between the '=' sign and the declaration of the variable 
Also put spaces in between conditional brackets 


## Debugging bash scripts 

To debug a script and find out what it's doing , you can run the `bash -x script.bash` command which will tell you what code is being run. And any errors that might occur during runtime.


# Configuring SSH 

dictionary attacks are commonly used to break into ssh servers , from what i've seen on my machine they typically use usernames and passwords that might be setup by default on the server. 

These are things you can do to harden your ssh server 
- Disable root login ( disabled by default) 
- Disable password login ( not disabled by default ) 
- Configure a non-default port for SSH  ( already done for most of my servers )
- Allow specific users only to login to ssh ( I haven't done this yet )


To configure these things , you can make all configuration changes in the /etc/ssh/sshd_config file. This config file is the default config used for an ssh server.

## Config option for disallowing the root user to login to ssh 

PermitRootLogin prohibit-password 

This only allows the root user to login if they have a valid pub/private key pair 


## Changing default ssh port 

Edit config file in /etc/ssh/sshd_config 

Add port to SELinux label 
`semanage port -a -t ssh_port_t -p tcp <PORTNUMBER>`

Allow port through firewall-cmd 

`firewall-cmd --add-port=<port>/tcp --permanent `

Then reload the configuration for the service 

`systemctl reload sshd`


Then reload the firewall-cmd config 

`firewall-cmd --reload`

You shoulden't really use the MaxAuthTries option since it's suseptible to ddos attacks. When this option is enabled it locks out the specified user trying to login. So someone could just try to login as that usera bunch to lock up the account. It's still good for monitoring security events as this option starts logging the failed attempts. 

Logs are written to the AUTHPRIV syslog utility. By default it writes the logs to /var/log/secure

## Restriciting which users can login to your ssh server 

You can enable access to your server by the usernames of the users. To do this , you must add the AllowUsers field in the /etc/ssh/sshd_config file 

## Other useful sshd options 

UseDNS -> Very inefficient if other users connections are slow , turn off for performance. This option verifies remote hostname is same as remote address 

MaxSessions -> specifies max number of sessions from the same remote IP. If you have users connecting to the server with multiple sessions it's a good practice to increase the amount of max sessions.  

TCPKeepAlive -> ensures clients that are unavailable are released 
ClientALiveInterval -> time before the server sends a packet to the client when no activity is detected. 

ClientAliveCountMax -> specifies how many of these packets are sent. if set to 30 and ClientAliveCountMax is set to 10 , connections are kept alive for about 5 minutes. 

The two options above can only be used for the server side of ssh connections. 
You can try using two options for clients which try to do the same thing 

ServerAliveInterval & ServerAliveCountMax 

modify the ~/.ssh/config for local users 

I'd also like to note other options that are used with ssh as well 

HostBasedAuthentication -> Allows only users who's keys are already present in /etc/ssh/ssh_known_hosts. To enable this , add the key in the users .ssh/authorized_keys and copy it over to the directory mentioned previously.


## Key locations 

Client/Sever public/private keys -> /etc/ssh

Clients pub pri key -> /home/user/.ssh

## Key pair authentication 

Generate public / private key 
`ssh-keygen`

Then copy the key over to your server , make sure password auth is enabled 
`ssh-copy-id -p 1234 user@192.1.1.1`

If you set a passphrase , cache the passphrase to save time 

`ssh-agent /bin/bash`

`ssh-add`

You can set a passphrase for the private key which is in most cases more secure, however it is inconveinient for the user as they will have to enter this key everytime they attempt to connect to the server. However you can cache the key for a short amount of time using the ssh-agent and ssh-add commands. To do so , see below 


# SELinux 

SELinux prevents system calls from being executed unless allowed. 
In selinux you have policies which contain rules that specify what source domain is allowed to access which target domain 
You have to be root user to use any of the commands 

Check all active ports on SELinux 

`semange port -l`

The names listed for these ports are labels , for example the label for the SSH port is ssh_port_t. The label relates to the service and port used. 

If you want to change the port for an existing label , you must modify the port listed on the label. 

Source domains can be a port or a process. 

Target domains could be a file , directory , or network port 

labels define access rules also called context labels 

SELinux has two modes,  enforcing mode , and permissive mode. 

IN enforcing mode, SELinux is fully operational and enforces all rules in the polic

in permissive mode, activity is logged however no access is blocked to any services so this mode isn't really secure 

Logging messages are written to /var/log/audit/audit.log 

you can change the mode for selinux in /etc/sysconfig/selinux 

On RHEL , by default the setting is set to enforcing 

To put selinux in disabled mode on RHEL 9 , you need to change the kernel boot argument to selinux=0 , you can also set permissive mode in the kernel boot options as well with enforcing=0 

You can use setenforce to check what mode selinux is in , you can switch between the two modes by specifying a number that relates to the mode 

Set permissive mode 

`setenforce 0 `

Set enforce mode 

`setenforce 1`


This only changes the mode temporarily , to keep the changes you will need to write it to /etc/sysconfig/selinux

You can also check the status of selinux with the sestatus command 
`sestatus -v `

If anyone tells you you need to disable selinux for an application , they're wrong as a policy can be added for any application. 

you can use `sepolicy generate` to generate a new policy for an application 


## Context labels 

Files and directories 
Ports 
Processes 
Users 

Context labels define the nature of the object. Rules are created to match context labels of source objects ( or source domains ) to labels of target objects ( target domains )   
So setting up these labels correctly is very important  as mismatching context labels can cause alot of issues with selinux. 


Make sure you know about context types as they are important for the exam 


# Configuring a firewall 

firewall-cmd uses the netfilter subsystem , it allows kernel modules to inspect incoming , outgoing , or forwarded packets and either allow the packet or block it.


iptables used to be the default firewall , however it has since been replaced by nftables. 

You can use the `nft` command to rules directly to nftables 

Firewalld is a system service that can configure firewall rules by using different interfaces.

Apps can request ports to be opened by using the DBus messaging system. Without requireing any action from the sys admin.

This allows apps to address the firewall from user space.

firewall-cmd manages the firewalld system service 


**Understanding Firewalld Zones**

a **zone** is a collection of rules that are applied to incoming packets matching a specific source address or network interface 

Firewalld applies to incoming packets by default , outgoing packets must be configured 

Zones are useful for servers that have multiple interfaces. Multiple zones allow you to set a specific set of rules for each interface. 

With servers with only one interface, you may only need 1 zone.

This zone is already set by default , and if no zone is available , packets are handled through the default zone. 


**Firewalld default zones**


### Block 

incoming connections are rejected with an "icmp-host-prohibited". Only connections that were initiated on this system are allowed

### Dmz 

For use on computers in the demilitarized zone , only selected incoming connections are accepted, limited access to the internal network is allowed.


### Drop

Any incoming packets are dropped and there is no reply.

### External 

For use on external networks with NAT enabled, used on routers. Only selected incoming packets are acccepted.

### Home 

For use with home networks  , computers on the same network are truested and only selected incoming connections are accepted.

### Internal 

Most computers on the same network are trusted , only selected incoming connections are accepted.

### Public 

Other computers in the same network are not trusted, limited connections are accepted. Used as the default zone for newly created network interfaces.

### Trusted 

All network connections are accepted 

### Work 

Most computers on the same network are trusted, only selected incoming connections are accepted.


---

**Understanding Firewalld Services**

Not the same as a service in systemd. 

A Firewalld service specifies what exactly should be accepted as incoming and outgoing traffic in the firewall.  

This typically includes ports to be opened and kernel modules that should be loaded 

XML files define the service. And they can be found in /usr/lib/firewalld/services

By looking at the service file for git.xml , you can see the port being defined and the protocol used for the service. 

You can also use the `firewall-cmd --get-services` command to see what services are available 

Services are added to zones 

To add your own services , you can put the XML files in the /etc/firewalld/services directory. They will be automatically added once the firewalld service is restarted.


**Working with Firewalld**

Remember to commit changes to on-disk once you are finished 

On the exam , only use ports if no services contain the ports that you want to open.

---

# NFS 


You should use NFS with an authentication service such as Lightweight Directory Access Protocol ( LDAP for short ) or kerberos 

**Setting up NFS**

1. Create local directory you would like to share 
2. Edit the /etc/exports file to define NFS share
3. Start NFS server
4. Configure firewall to allow incoming NFS traffic



