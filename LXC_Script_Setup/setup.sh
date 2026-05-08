# Created by Leandro Paulino
# Version 2.0
# Attention: run script as a root since the commands does not include sudo.
#!/bin/bash

# Type your username here
USER='lptech'
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
apt update && apt install -y ca-certificates curl gnupg && \
install -m 0755 -d /etc/apt/keyrings && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
chmod a+r /etc/apt/keyrings/docker.gpg && \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
tee /etc/apt/sources.list.d/docker.list > /dev/null && \
apt update && \
apt install -y docker-compose-plugin

apt install vim -y

# Create a user called 'lptech'
yellow_echo "**** Creating user and adding to the groups ****"
useradd $USER

# Add the user '$USER' to the 'docker' and 'sudo' groups
usermod -aG docker $USER
usermod -aG sudo $USER

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
timedatectl set-timezone America/Sao_Paulo

# Download the docker container image
# yellow_echo "**** Download the docker container image ****"

# yellow_echo "**** Termino do Script!!! ****"

# yellow_echo "**** Reinicie o LXC container ****"

# Exit 
exit
