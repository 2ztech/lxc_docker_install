#!/bin/bash

apt-get update
apt-get install ca-certificates curl gnupg lsb-release -y
    
#add gpg key
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#update repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  
#update apt index
apt-get update

#install docker
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

 #portainer volume create
  docker volume create portainer_data
  
  #portainer ce install
  docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
  
  #message
  ip=$(hostname -I | awk '{print $1}')
  port="9443"

  printf "You can access Portainer at https://%s:%s\n" "$ip" "$port"
