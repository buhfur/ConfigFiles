
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


## GPT 

