# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# This is an example how to use the chef cookbooks with Vagrant.
#
Vagrant::Config.run do |config|
  config.vm.box = "f18"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "../cookbooks"
    chef.json = { :foo  => "bar" }
    chef.add_recipe "jru"
    chef.add_recipe "zsh"
    chef.add_recipe "devstack"
  end
end
