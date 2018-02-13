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
  config.vm.define "ubuntu_16" do |d|
    d.vm.box = "ubuntu/xenial64"
    d.vm.network "private_network", type: "dhcp"
    d.vm.network "forwarded_port", guest: 8080, host: 8280
    d.vm.provider "virtualbox" do |v|        
      v.memory = 4096
    end
  end

  config.vm.define "ubuntu14_gui" do |d|
    d.vm.box = "ubuntu/trusty64"
    d.vm.network "private_network", type: "dhcp"
    d.vm.network "forwarded_port", guest: 8080, host: 8280
    d.vm.provision "shell", inline: "sudo apt-get update"
    d.vm.provision "shell", inline: "sudo apt-get install -y xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11"
    d.vm.provision "shell", inline: "sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config"
    d.vm.provider "virtualbox" do |v|        
      v.memory = 4096
      v.gui=true
    end
  end

  config.vm.define "ubuntu_14" do |d|
    d.vm.box = "ubuntu/trusty64"
    d.vm.network "private_network", type: "dhcp"
    d.vm.network "forwarded_port", guest: 8080, host: 8180
    #sobreescribe el forward automatico de ssh con el id: "ssh"
    d.vm.network :forwarded_port, guest: 22, host: 2322, id: "ssh"
    d.vm.provision :shell, path: "scripts/bootstrap.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/oracle_java.yml -c local"
    d.vm.provider "virtualbox" do |v|        
      #v.memory = 6144
      v.memory = 2048
    end
  end
  config.vm.define "ubuntu_14_2" do |d|
    d.vm.box = "ubuntu/trusty64"
    d.vm.network "private_network", type: "dhcp"
    d.vm.network "forwarded_port", guest: 8080, host: 8180
    #sobreescribe el forward automatico de ssh con el id: "ssh"
    d.vm.network :forwarded_port, guest: 22, host: 2322, id: "ssh"
    d.vm.provision :shell, path: "scripts/bootstrap.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/oracle_java.yml -c local"
    d.vm.provider "virtualbox" do |v|        
      #v.memory = 6144
      v.memory = 2048
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
    d.vm.network "forwarded_port", guest: 8088, host: 8088
    d.vm.network "forwarded_port", guest: 8081, host: 8081
    d.vm.network "forwarded_port", guest: 8080, host: 8080
    d.vm.network "forwarded_port", guest: 8443, host: 8443
    d.vm.network "forwarded_port", guest: 50000, host: 50000
    d.vm.network "forwarded_port", guest: 30000, host: 30000
    d.vm.network "forwarded_port", guest: 80, host: 80
    d.vm.provision :shell, path: "scripts/bootstrap.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/docker.yml -c local"
    #d.vm.provision :shell, inline: "docker run "
    d.vm.provider "virtualbox" do |v|        
      v.memory = 4098
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
