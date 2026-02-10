# -*- mode: ruby -*-
# vi: set ft=ruby :

$etchosts = <<-SCRIPT
cp /etc/hosts /root && \
echo '\n192.168.56.210 control.devopstraining.com' >> /etc/hosts && \
echo '192.168.56.211 managed_1_r9.devopstraining.com m-rocky9' >> /etc/hosts && \
echo '192.168.56.212 managed_2_c7.devopstraining.com m-centos7' >> /etc/hosts 
SCRIPT


Vagrant.configure("2") do |config|



  config.vm.define "managed_1_r9" do |managed_1_r9|
    managed_1_r9.vm.box = "bento/rockylinux-9"
    managed_1_r9.vm.provider "virtualbox" do |vb|
      vb.memory = "768"
    end
    managed_1_r9.vm.network "private_network", ip: "192.168.56.211"
    managed_1_r9.vm.synced_folder "./shared", "/shared"
    managed_1_r9.vm.provision "shell", inline: $etchosts
    managed_1_r9.vm.provision "shell", inline: "useradd -m -p '$1$1TFUzyze$yuYQK7Nszcs7QjCd6KAAT1' rocky" #passwd -1 "rocky"
    managed_1_r9.vm.provision "shell", inline: "hostnamectl set-hostname m-rocky9"
  end

  config.vm.define "managed_2_c7" do |managed_2_c7|
    managed_2_c7.vm.box = "geerlingguy/centos7"
    managed_2_c7.vm.provider "virtualbox" do |vb|
      vb.memory = "768"
    end
    managed_2_c7.vm.network "private_network", ip: "192.168.56.212"
    managed_2_c7.vm.synced_folder "./shared", "/shared"
    managed_2_c7.vm.provision "shell", inline: $etchosts
    managed_2_c7.vm.provision "shell", inline: "useradd -m -p '$1$GLz11URO$/o.t34TrCJkBD9iIOyHJ0.' centos" # openssl passwd -1 "centos"
    managed_2_c7.vm.provision "shell", inline: "hostnamectl set-hostname m-centos7"
  end


  config.vm.define "control" do |control|
    control.vm.box = "bento/rockylinux-9"
    control.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
    end
    control.vm.network "private_network", ip: "192.168.56.210"
    control.vm.hostname = "control"
    control.vm.synced_folder "./shared", "/shared"
    control.vm.provision "shell", inline: $etchosts
    control.vm.provision "shell", path: "provision/ansible.sh"
    control.vm.provision "shell", path: "provision/awx.sh"
    control.vm.provision "shell", inline: "ssh-keyscan m-rocky9 >> ~/.ssh/known_hosts" #ssh host key check (fingerprint)
    control.vm.provision "shell", inline: "ssh-keyscan m-centos7 >> ~/.ssh/known_hosts" #ssh host key check (fingerprint)
    control.vm.provision "shell", inline: "hostnamectl set-hostname control"
    control.vm.network "forwarded_port", guest:8043, host:8043
  end
end
