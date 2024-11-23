

# backup solutions for home self hosted network 

# What do I need to backup 

- Proxmox virtual machines 

- Truenas shares 

- buhfur-pc 

- skylar-pc 

- skylar-pc windows 

- buhfur-pc windows 

- media-server docker containers 


# What do I want ? 

* backup tool that can create incremental backups of proxmox VM's 


# Where would the backups live 

The backups would primarily live on the TrueNAS network drive, however i'm not so comfortable with the stability of my shared drive. It's very limited storage wise and i'm planning on moving all volumes to an off host RAID enclosure to utilize the dozens of spare  1 TB hard drives I have just rotting in my closet 



## Redundancy 

* rclone backups from shared drive / hosts to google drive or some hosted solution which I don't really like as one of my main goals with these projects are to reduce reliance on proprietary cloud providers. 






