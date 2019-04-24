# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  config.vm.define "centos-master" do |d|
    d.vm.box = "centos/7"

    d.vm.network "private_network", ip: "192.168.99.151"
    d.vm.provider "virtualbox" do |v|
      v.memory = 8192
      v.cpus = 2
    end
  end

  config.vm.define "centos-node" do |d|
    d.vm.box = "centos/7"
    d.vm.network "private_network", ip: "192.168.99.152"
    d.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 1
    end
  end

end
