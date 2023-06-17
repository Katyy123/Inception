#!/bin/bash

#---INSTALL DOCKER ENGINE ON UBUNTU---

#Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

#Add Docker’s official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

#Use the following command to set up the repository:
echo \
"deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Update the apt package index:
sudo apt-get update

#Install Docker Engine, containerd, and Docker Compose:
#last version:
#sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#specific version:
apt-cache madison docker-ce | awk '{ print $3 }'
VERSION_STRING=5:23.0.0-1~ubuntu.22.04~jammy
sudo apt-get install docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-buildx-plugin docker-compose-plugin



#---LINUX POST-INSTALLATION STEPS FOR DOCKER ENGINE to create the docker group and add your user---

#Create the docker group:
sudo groupadd docker

#Add your user to the docker group:
sudo usermod -aG docker $USER

#activate the changes to groups:
newgrp docker



#---INSTALL DOCKER COMPOSE---

#download Docker Compose:
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

#Apply permissions to the binary:
sudo chmod +x /usr/local/bin/docker-compose



#---INSTALL VIM AND MAKE---

sudo apt install vim
sudo apt install make



#---GENERATE SSH KEY---
ssh-keygen -t rsa



#---TEST---

#Verify that the Docker Engine installation is successful by running the hello-world image:
sudo docker run hello-world

#Verify that you can run docker commands without sudo:
docker run hello-world

#Test the Docker Compose installation to check it worked properly:
docker-compose --version


