# -*- mode: ruby -*- 
# vi: set ft=ruby :

Vagrant.configure("2") do |config|



  config.vm.define "ansible" do |ansible| # ansible control node  
    ansible.vm.box = "bento/rockylinux-9" # vagrant box to use  
    ansible.vm.provider "virtualbox" do |vb| # virtualbox provider settings
      vb.memory = "1024" # memory size for the VM 
    end
    ansible.vm.network "private_network", ip: "192.168.56.211" # private network with static IP 
    ansible.vm.synced_folder "./shared", "/shared" # shared folder between host and VM
    ansible.vm.provision "shell", inline: "dnf install -y git ansible" # install git and ansible on the control node
    ansible.vm.provision "shell", inline: "hostnamectl set-hostname ansible" # set hostname for the control node
  end
  

  config.vm.define "web" do |web| # web server node
    web.vm.box = "geerlingguy/centos7"
    web.vm.provider "virtualbox" do |vb| 
      vb.memory = "1024" 
    end
    web.vm.network "private_network", ip: "192.168.56.212"
    web.vm.synced_folder "./shared", "/shared"
    # create user, "homework" as sudoer with password "homework" (hashed using openssl)
    web.vm.provision "shell", inline: "useradd -m -p '$1$1TFUzyze$yuYQK7Nszcs7QjCd6KAAT1' homework && echo 'homework ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers" # create user "homework" with password "homework" and add to sudoers for passwordless sudo access  
    web.vm.provision "shell", inline: "hostnamectl set-hostname web" # set hostname for the web server node
    web.vm.network "forwarded_port", guest:80, host:8888, auto_correct: true # forward port 80 on the guest to port 8888 on the host, with auto-correction if port 8888 is already in use
  end
end
