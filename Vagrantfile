# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu/xenial64"

  config.vm.synced_folder "resources/", "/resources"

  config.vm.provision "shell", path: "scripts/bootstrap.sh"

end