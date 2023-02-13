#!/bin/bash
 
 #portainer volume create
 docker volume create portainer_data
  
  #portainer ce install
  docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
    
  #message
  ip=$(hostname -I | awk '{print $1}')
  port="9443"

  printf "You can access Portainer at https://%s:%s\n" "$ip" "$port"
