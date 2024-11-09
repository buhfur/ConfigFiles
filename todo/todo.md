
# Proxmox todo 

**REMINDER: add notes for every change you make to a VM or setting in proxmox**

- [ ] convert adguard server into docker container
- [ ] convert jellyfin into docker container
- [x] convert torrent-server into docker container 
    - [x] setup protonvpn docker container 
        - [x] setup bridge network between protonvpn and deluge container 
- [x] convert sonarr into docker container 
- [x] convert radarr into docker container 
- [x] convert jackett into docker container 

- [ ] Create new debian vm for docker containers
    - [x] configure ssh
        - [x] copy redhat ssh token over to media-server
    - [x] install docker
    - [x] clone docker-media-server repo
    - [ ] create /root/docker-dns-server repo on github
    - [ ] add github token to VM 
    - [ ] add protonvpn openvpn password to compose.yml file 

- [ ] configure and setup firewall 
    - [x] remove interface 1 & interface 5 from internal hardware switch
    - [ ] configure management interface 
    - [ ] configure static IP 

- [ ] Draw network diagram for planned firewall installation  on paper 
    - [ ] use network diagram tool to make diagram for home network


# Proxmox project writeup 

- [x] create projects.md which serves as the directory for referencing other projects 
    - [ ] attach pictures and brief description for each project in projects.md 
    - [ ] add link to each project page under it's picture and brief description.

- [ ] Create page dedicated to each individual projects 
- [x] create proxmox.md in projects/ directory in buhfur.github.io directory 

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

- [ ] setup blog for project updates 
    * [ ] write blog post about firewall installation and configuration 

- [ ] change ip's on all vm's to fit inside the 192.168.3.0/22 network

- [ ] setup adguard home dns server as docker container 

- [ ] setup minecraft server for minecraft 1.21



  
