

# backup solutions for home self hosted network 

## What do I need to backup 

- Proxmox virtual machines : VM snapshots 

- Truenas : /mnt/pool1/backups /mnt/pool2/server 

- buhfur-pc @ skylar-pc : /home/ directories 


- skylar-pc windows 

- buhfur-pc windows 

- media-server docker containers 


## What do I want ? 

* backup tool that can create incremental backups of proxmox VM's 
* Fast write / read speeds 

- What makes up a backup tool ? 
    * backup rotation scheme :
        * Backup rotation is the act of storing backup data to a computer to some form of computer media (tapes, hard disks, NVME drives ?).
        * A backup rotation scheme can specify how long a backup of data should be retained and how the backup should be used 
        * Scheme defines how and when each removable storage is used 

--- 

# Known backup rotation schemes 

## FIFO : oldest backups are overwritten with newest backup ? 

- pros : 

    * long chain of daily backups 

    * good for when backed up data before rotation period is irrelevant  

- cons:

    * susceptible to data loss, errors on existing media will be duped 

## Grandfather-father-son (GFS)

### General info 

* daily,weekly,monthly intervals of archived data 

* daily backups are rotated using FIFO scheme on a 3 month basis 

* weekly backups are rotated on a bi-yearly

* monthly backups are rotated on a yearly basis  

- pros : 
    * rotations can be configured for different periods 



# Disaster recovery plan 

how should I design my disaster recovery plan for the backups ?


* Use backups from off-site cloud storage 






