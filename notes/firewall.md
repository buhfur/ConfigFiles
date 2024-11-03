

# Fortigate Firewall Configuration

* Configured eero router DHCP/NAT seting to "bridge" mode 

* Remove internal5 & internal1 from hardware switch 

* Changed internal5 Alias to MGMT

* Changed internal5 role to DMZ

* Moved cable on fortigate  port 5 to Port 2 on dumb switch

* Added HTTPS , SSH , PING to Administrative Acess section for internal5 

* Configured IP/Network Mask 

* Enabled Device Detection on internal5 

* Added 172.16.0.10/24 with gateway of 172.16.0.254 on my local machine 
> sudo nmcli connection add type ethernet con-name fortigate-mgmt ifname enp13s0 ip4 172.16.0.10/24 gw4 172.16.0.254

* Removed HTTP , HTTPS , SSH from all ports except MGMT 

* Configured IP for DMZ interface to 0.0.0.0/0.0.0.0 

* Disabled DHCP server on DMZ interface 

* Changed DMZ interface to disabled 

* Configured addressing mode of WAN2 to "manual"

* Configured address on Wan2 interface to 0.0.0.0/0.0.0.0 

* Configured status of WAN2 to "disabled"

* Changed HTTPS port to 8765 in System -> Settings 

* Changed hostname to "buhfur-fortigate" in Settings 

* Changed gateway on eno1 connection on local host to "192.168.4.34"
