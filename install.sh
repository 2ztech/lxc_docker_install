#!/bin/bash

apt-get update
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    -y
    
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

#test install
docker run hello-world
