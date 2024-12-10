


# Minecraft Server 

I currently have docker compose instance running which manages the server. The server runs alongside the compose instance used for my torrenting server.    

## Backup 


I need a realiable way to backup the servers data/ folder and account for the following circumstances 

- Hypervisor suddenly loses power 

- The container is suddenly stopped  



### Backup script idea 

Process :

1. message goes out on minecraft server notifying of backup 

2. 'Docker compose down' command is run 

3. /root/minecraft-server/data/ is backed up to /mnt/backups/backups/minecraft-backups/minecraft-$(timestamp)

4. After backup is complete , server is restarted with 'docker compose up -d '

5. script outputs message stating backup was successful and message stating if server was successfully restarted  






