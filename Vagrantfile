# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "almalinux/9"
    ansible.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
    ansible.vm.network "private_network", ip: "192.168.56.211"
    ansible.vm.synced_folder "./shared", "/shared"
    ansible.vm.provision "shell", path: "provision/ansible_setup.sh"
  end

  config.vm.define "web" do |web|
    web.vm.box = "almalinux/9"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    web.vm.network "private_network", ip: "192.168.56.212"
    web.vm.synced_folder "./shared", "/shared"
    web.vm.provision "shell", path: "provision/web_setup.sh"
    web.vm.network "forwarded_port", guest: 80, host: 8888, auto_correct: true
  end

end
