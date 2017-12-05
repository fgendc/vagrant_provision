# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "openshift" do |d|
    d.vm.box = "iamseth/rhel-7.3"
    d.vm.box_version = "1.0.0"
    d.vm.network "private_network", ip: "192.168.99.201"
    d.vm.provider "virtualbox" do |v|        
      v.memory = 4096 
    end
  end
  config.vm.define "ubuntu" do |d|
    d.vm.box = "ubuntu/xenial64"
    d.vm.network "private_network", type: "dhcp"
    d.vm.provider "virtualbox" do |v|        
      v.memory = 4096
    end
  end

  config.vm.define "ubuntu_test" do |d|
    d.vm.box = "ubuntu/xenial64"
    d.vm.network "private_network", type: "dhcp"
    d.vm.provision :shell, path: "scripts/bootstrap.sh"
    d.vm.network "forwarded_port", guest: 8081, host: 8082
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/oracle_java.yml -c local"
    d.vm.provider "virtualbox" do |v|        
      v.memory = 2048
    end
  end

  config.vm.define "docker" do |d|
    d.vm.box = "ubuntu/xenial64"
    d.vm.hostname = "docker"
    d.vm.network "private_network", ip: "192.168.99.200"
    d.vm.network "forwarded_port", guest: 8080, host: 8080
    d.vm.network "forwarded_port", guest: 8081, host: 8081
    d.vm.network "forwarded_port", guest: 5000, host: 5000
    d.vm.network "forwarded_port", guest: 80, host: 80
    d.vm.provision :shell, path: "scripts/bootstrap.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/docker.yml -c local"
    #d.vm.provision :shell, inline: "docker run "
    d.vm.provider "virtualbox" do |v|        
      v.memory = 2048
    end
  end

  config.vm.define "docker2" do |d|
    d.vm.box = "ubuntu/xenial64"
    d.vm.network "private_network", ip: "192.168.99.201"
    d.vm.network "forwarded_port", guest: 8080, host: 8080
    d.vm.network "forwarded_port", guest: 8081, host: 8081
    d.vm.network "forwarded_port", guest: 5000, host: 5000
    d.vm.network "forwarded_port", guest: 80, host: 80
    d.vm.provision :shell, path: "scripts/bootstrap.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/docker.yml -c local"
    #d.vm.provision :shell, inline: "docker run "
    d.vm.provider "virtualbox" do |v|        
      v.memory = 5246
    end
  end

end
