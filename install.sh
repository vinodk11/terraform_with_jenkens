#!/bin/bash
# AWS EC2 User Data script for Ubuntu auto-update & upgrade

# Log everything to a file
exec > /var/log/user-data.log 2>&1

# Prevent interactive prompts during package installation
export DEBIAN_FRONTEND=noninteractive

# Update package list
apt-get update -y

# Upgrade installed packages
apt-get upgrade -y

# Optional: Full distribution upgrade
apt-get dist-upgrade -y

# Optional: Remove unused packages
apt-get autoremove -y

# Example: Install basic tools
apt-get install -y curl wget unzip git

# Reboot after upgrade (optional)
# reboot


##############installing   jenkins ##########################

wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

apt update 
apt install jenkins -y
systemctl start jenkins

################### installing terraform ###################

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

apt update

apt install terraform -y