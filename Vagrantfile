# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "bento/rockylinux-9"
    ansible.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    ansible.vm.network "private_network", ip: "192.168.56.211"
    ansible.vm.synced_folder "./shared", "/shared"

    # Install Ansible + git (keep provisioning minimal)
    ansible.vm.provision "shell", inline: <<-SHELL
      dnf -y install epel-release || true
      dnf -y install git ansible
      hostnamectl set-hostname ansible
    SHELL
  end

  config.vm.define "web" do |web|
    web.vm.box = "bento/rockylinux-9"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    web.vm.network "private_network", ip: "192.168.56.212"
    web.vm.synced_folder "./shared", "/shared"

    # Create 'homework' user with password 'homework' + passwordless sudo
    web.vm.provision "shell", inline: <<-SHELL
      id homework >/dev/null 2>&1 || useradd -m homework
      echo "homework:homework" | chpasswd
      echo "homework ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/homework
      chmod 440 /etc/sudoers.d/homework
      hostnamectl set-hostname web
    SHELL

    web.vm.network "forwarded_port", guest: 80, host: 8888, auto_correct: true
  end

end
