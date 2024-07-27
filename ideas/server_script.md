# Server side script that performs ssh-copy-id for multiple hosts

The idea is that I would like to enable PKI for multiple hosts on host A. Therefore I would like a script that automatically generates an ssh key , and copies the key to host A 


1. Scan for all IP's on my network with nmap , save the IP's to a variable or text file in /tmp
2. attempt to connect to host. Add users public key to users authorized_keys file on host A. 

