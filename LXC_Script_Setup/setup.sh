# Created by Leandro Paulino
# Version 1.4
# Attention: run script as a root since the commands does not include sudo.
#!/bin/bash

# Function to echo in yellow
yellow_echo() {
  echo -e "\e[33m$1\e[0m"
}

# Update package information and upgrade existing packages
yellow_echo "**** Updating and Upgrading the OS ****"
apt update -y
apt upgrade -y

yellow_echo "**** Installing docker and docker-compose ****"
# Install Docker
apt install docker.io -y

# Install Docker Compose
apt install docker-compose -y

# Create a user called 'lptech'
yellow_echo "**** Creating user and adding to the groups ****"
useradd user

# Add the user 'lptech' to the 'docker' and 'sudo' groups
usermod -aG docker user
usermod -aG sudo user

# Create an empty docker-compose.yml file in /home
touch docker-compose.yml

yellow_echo "**** Installing Apps: curl, openssh ****"
# Install curl and ensure SSH is installed
apt install curl -y
apt install openssh-server -y

# Add 'PermitRootLogin yes' to the end of /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

yellow_echo "**** Restarted the SSH service ****"
# Restart the SSH service
service ssh restart

yellow_echo "**** Set the timezone ****"
# Set the timezone
timedatectl set-timezone America/Brasilia

# Download the docker container image
# yellow_echo "**** Download the docker container image ****"

# yellow_echo "**** Termino do Script!!! ****"

# yellow_echo "**** Reinicie o LXC container ****"

# Exit 
exit
