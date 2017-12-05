#!/bin/bash

set -e

#echo "Installing docker..."
#sudo apt-get update
#sudo apt-get install -y \
#    apt-transport-https \
#    ca-certificates \
#    curl \
#    software-properties-common
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"
#sudo apt-get update
#sudo apt-get install docker-ce


echo "Installing Ansible..."
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update
sudo apt install -y ansible apt-transport-https ca-certificates curl
sudo cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg

#apt-get update -y
#apt-get install -y python-pip python-dev
#pip install ansible==1.9.2
#mkdir -p /etc/ansible
#touch /etc/ansible/hosts
#cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg
#mkdir -p /etc/ansible/callback_plugins/
#cp /vagrant/ansible/plugins/human_log.py /etc/ansible/callback_plugins/human_log.py