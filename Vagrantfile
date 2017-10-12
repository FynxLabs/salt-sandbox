# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial"
  config.vm.provision "shell", path: "shell/docker-install"
  config.vm.provision "shell", path: "shell/docker-compose-install"

  config.vm.network :private_network, ip: "192.168.5.5"
end
