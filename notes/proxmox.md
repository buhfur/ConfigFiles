

# Proxmox notes 

This document represents the changelog for my proxmox hypervisor 


# 10/13/2024 * Added all private IP's of hosts on local network to truenas allowlist for pool1 & pool2 

* Removed torrentfunk, torlock , and idope.se from Jackett indexers 

* Removed  torlock , and idope.se from sonarr indexers

* Removed broken torrent for Rick And Morty Season 2 

* Changed share settings on pool1 under "Purpose" , changed from 'Default Share Parameters' to 'No Presets'

# 10/23/2024 

* Unblocked protonvpn.com in adguard home 

* Unblocked vpn-api.proton.me in adguard home 

* updated adguard blocklists 

* turned off mouse for tmux on buhfurpc 

* removed ca-22.protonvpn.tcp.conf & ca-49.protonvpn.udp.conf from torrent server openvpn connections

* added new protonvpn openvpn country UDP configs to torrent-server and rebooted 

# 10/27/2024 

* commented out pool1 entry in fstab on jellyfin host 

* Disabled NTLMv1 Auth as this is a vulnerable protocol 

* Updated backup.service to be started after smbd.service & network.service to prevent the backup service from failing in the event the server is restarted and then attempts to run the scheduled backup . 

* Changed /etc/fstab on proxmox root to remount-rw if there are any errors mounting the smb shares 

# 10/28/2024 

* Added x-systemd.automount to /etc/fstab on proxmox root in an attempt to ensure the server has access before attempting to backup 
* also added the prior mentioned fstab option to apply to pool2 as well.

<<<<<<< HEAD
# 11/32/2024 

* converted deluge to a docker container 

* setup protonvpn docker container 

* bridged deluge and protonvpn docker containers together on the "torrent-bridge" network

* configured incoming address on deluge container to docker bridge network IP 
=======

# 10/31/2024

* Added backups pool to fstab on torrent-server , located in /mnt/backups. Credentials stored in .backupscredentials file in home of torrent-user. Restricted with 600 perms in home.

* Changed perms of /home/torrent-user/.smbcredentials to 600 

* Installed firewalld on torrent-server

* Deleted "mnt-media.automount" and "mnt-media.mount" on torrent-server
>>>>>>> b82baba07c9dfc0865dce3eb9ae672dcffbee2f3
