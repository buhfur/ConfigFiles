
# Network diagram 


## Hosts

- TrueNAS : 
    * IP : 192.168.3.100/255.255.252.0 ( /22 )
    * Ports : 
        - 139/tcp ( netbios )
        - 445/tcp ( microsoft-ds )

- Media-server
    * IP : 192.168.3.101/255.255.252.0( /22 )

    * Ports : 

        - 5192/tcp ( ssh )
        
    * Docker containers
        - jellyfin

        - sonarr 

        - radarr 

        - jackett 

        
- Redhat 
    * IP : 192.168.3.104/255.255.252.0( /22 )
    * ports : 5110/tcp ( ssh ) 


- Buhfur-pc 
    * IP : 192.168.3.184/255.255.252.0( /22 )
    * ports : 5189/tcp 



- Frontier WAN ( fortigate ) 
    * IP : 192.168.4.146/255.255.255.0( /24 )
