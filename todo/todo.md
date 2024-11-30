
# Proxmox todo 

**REMINDER: add notes for every change you make to a VM or setting in proxmox**

- [x] convert jellyfin into docker container
- [x] convert torrent-server into docker container 
    - [x] setup protonvpn docker container 
        - [x] setup bridge network between protonvpn and deluge container 
- [x] convert sonarr into docker container 
- [x] convert radarr into docker container 
- [x] convert jackett into docker container 

- [x] Create new debian vm for docker containers
    - [x] configure ssh
        - [x] copy redhat ssh token over to media-server
    - [x] install docker
    - [x] clone docker-media-server repo

- [x] configure and setup firewall 
    - [x] remove interface 1 & interface 5 from internal hardware switch
    - [x] configure management interface 
    - [x] configure static IP 

- [ ] Draw network diagram for planned firewall installation  on paper 
    - [ ] use network diagram tool to make diagram for home network

- [ ] setup proxmox backup server 

# Config todo 

- [ ] make polybar show on all monitors
- [ ] connect bluetooth earbuds to main desktop 
    - [ ] find out why pulse audio is not showing earbuds as output device. 
- [ ] install protonvpn client on buhfurpc 

# Notes todo 

- [x] move documentation from ryanm.dev to dedicated github pages blog site
    - [ ] change each file to use the same syntax for the jekyll just-the-docs template  
---


# Current ( remove as completed over time ) 

- [ ] Write blog posts for proxmox Hypervisor self-hosting project 
    - [ ] Use chatgpt to improve the formatting 

- [ ] Setup web server ,tracker , and metainfo file for torrent to host 
    - [x] setup apache web server on torrent-server in docker container
        - [ ] add some docker instructions along the way 
        - [x] add note about how to attach to docker container
        - [x] add note about how to change configuration of apache webserver container
    - [ ] generate metainfo file using mktorrent 
    


- [x] change background of i3 desktop 
- [x] allow proxmox webui to be accessed from public IP 
- [x] allow firewall to be acccessed from public IP ( sorta ) 



# Today at work 

- [ ] backup 'lounsbury242@gmail.com Backup authentication codes.txt' to buhfur-pc  and ENCRYPT ( HIGH PRIORITY )
- [ ] setup wake on lan on buhfur pc , UEFI settings are already enabled 
- [ ] configure radarr , sonarr , jackett to work and start downloading shiet 






### Todays current tasks 

- [ ] find out why torrents are not downloading on deluge docker container 
- [x] encrypt firefox passwords on backup drive 

- [ ] send minecraft world backups to cloud provider using rclone  
    - [ ] compress minecraft backups for rclone to the smallest you can 
        - [ ] try out zstd 
    - [ ] configure rclone on media-server root user 
    - [ ] create separate systemd timer and unit for running the script and triggering the unit 
    - [ ] add these notes to README.md on docker-minecraft-server



- [x] check GPU usage while idle ? 
    - [ ] malware scanner 
        - [ ] install lynis
    - [ ] rootkit scanner 
        - [ ] look up how you detect a rootkit is running 
    

--- 

### Queue  

- [ ] find backup solution for all hosts on my network 
- [ ] install second minecraft server for creative mode 
- [ ] install firmware update for fortigate after backing up config 
- [ ] setup blog on github pages 
- [ ] setup adguard container 
- [ ] backup solution for TrueNAS backup shared pool 
- [ ] export passwords from firefox to CSV and save on backup drive 

- [ ] create repo for docker containers on media-server
    - [ ] add docker container 
- [x] checkup on the minecraft backup script 
    - [x] find out how to tear down compose from systemd unit 
    - [x] add WorkingDirectory field to systemd unit 
    - [ ] cloud based redundancy for minecraft server saves ?



- [ ] enable xbox controller support for minecraft on skylar-pc  
    - [ ] if xpad doesn't work , install xboxdrv



- [x] setup cronjob to backup minecraft server 
    - [x] setup backup systemd unit 
    - [x] setup backup systemd timer unit

- [x] setup jellyfin docker container
    - [ ] configure "user" on jellyfin 
    - [x] setup reverse proxy for jellyfin 
    - [ ] configure port forward rule on fortigate 

- [x] configure radarr , sonarr, jackett for deluge client 
    - [ ] add watchlists to sonarr , radarr , jackett 

- [ ] setup adguard home container 
- [ ] enable wake on LAN on buhfur-pc in UEFI menu 

    - [ ] configure port forwarding rule on fortigate 
    - [ ] forward wake-on-lan port on router 

- [x] research solutions to control thermal take fan controller on linux 
    - [ ] create lite windows 10 virtual machine and install Thermal Take RGB Plus  
    - [ ] see if this can turn the LED's on the fans off , or at least to something else 

- [ ] configure zsh plugins on sparevm 
- [ ] configure zsh plugins on buhfur-pc 



# future TODO when I get the time / money 

- [ ] new router to create static route

