
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

- [x] enable middle mouse pasting in tmux 
    - [x] see notes todo for tmux notes 
- [x] allow mouse scrolling through Vim while using tmux 
- [ ] make polybar show on all monitors
- [ ] connect bluetooth earbuds to main desktop 
    - [ ] find out why pulse audio is not showing earbuds as output device. 
- [ ] install protonvpn client on buhfurpc 

# Notes todo 

- [x] add notes on how to paste using middle mouse button in tmux by holding shift 
- [x] make folder for 'troubleshooting' various things 
- [x] write post about BitTorrent and troubleshooting issues
- [x] add TOC to windows.md 
- [ ] move all notes and project related stuff to another github page using a mkdocs 
- [ ] write troubleshooting guide for proxmox 500 "read-only disk isssue" 
- [ ] setup blog for project updates 
    * [ ] write blog post about firewall installation and configuration 

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



# Today

- [ ] setup cronjob to backup minecraft server 
    - [ ] setup backup systemd unit 
    - [ ] setup backup systemd timer unit

- [x] setup jellyfin docker container
    - [ ] configure "user" on jellyfin 
    - [x] setup reverse proxy for jellyfin 
    - [ ] forward jellyfin port on eero router to fortigate IP 
    - [ ] configure port forward rule on fortigate 

- [ ] configure radarr , sonarr, jackett for deluge client 

- [ ] setup adguard home container 
- [ ] enable wake on LAN on buhfur-pc in UEFI menu 

    - [ ] configure port forwarding rule on fortigate 
    - [ ] forward wake-on-lan port on router 

