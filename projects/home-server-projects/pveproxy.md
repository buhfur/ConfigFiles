

# pveproxy 

Problem : 

* I currently have 2 hosts I would like to expose on my network , jellyfin and a proxmox webui.

* pveproxy is a reverse proxy for the webui , forwarding requests made to 443 to redirect to port 8006

* Jellyfin is a container in a compose file alongside an nginx reverse proxy , it forwards requests made from port 80 to redirect to port 8096 

* Port 8096 is forwarded in my router and my firewall for jellyfin 

* port 8006 is the port exposed by my router and firewall proxmox 

* all requests to my public ip route to proxmox webui and I cannot access jellyfin from the WAN IP 


