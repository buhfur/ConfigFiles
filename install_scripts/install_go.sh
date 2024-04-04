#!/bin/sh

rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz 
wait
# download golang binaries 
wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz -O /home/$SUDO_USER/Downloads
wait
# untar binaries and copy to /usr/local/
tar xzf /home/$SUDO_USER/Downloads/go1.22.2.linux-amd64.tar.gz -C /usr/local/

wait

# Add go lang to path 

export PATH=$PATH:/usr/local/go/bin



