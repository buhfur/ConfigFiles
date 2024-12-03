

# backup solutions for home self hosted network 

## What do I need to backup 

- Proxmox virtual machines : VM snapshots 

- Truenas : /mnt/pool1/backups /mnt/pool2/server 

- buhfur-pc @ skylar-pc : /home/ directories 


- skylar-pc windows 

- buhfur-pc windows 

- media-server docker containers 
    - minecraft world backups 

- game saves 

## What do I want ? 

* backup rotation scheme 
* hashing for verification 
* Disaster recovery using offsite hosting  
* home drives of hosts , vm snapshots from proxmox 
* distributed 
* incremental backups ( can restore to specific backup indexed by date )
* installs systemd units after configuration  
* separate host which is activated by Wake-on-lan when it's time to archive 
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



---


# Minecraft server backup 

* debian host has 2 systemd units with an accompnying timer unit which runs a script from the docker containers working directory. 

* At 6 AM daily EST , the backup-minecraft.service unit is triggered by backup-minecraft.timer 

* There are two additional systemd units for off site backups. Backups will be copied over to my personal google drive for backing up the entire directory of backups. The unit will use rclone for copying the contents of the compressed archive of daily minecraft backups. Both units will be named "backup-minecraft-server-cloud.service" "backup-minecraft-server-cloud.timer" respectively



