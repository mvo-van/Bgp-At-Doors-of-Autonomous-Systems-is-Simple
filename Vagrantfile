# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.box = "GNS3"
	config.vm.synced_folder ".", "/opt/badass", create: true
	config.vm.network "private_network", ip: "192.168.56.3", name: "vboxnet3"
	config.ssh.host = "192.168.56.3"
	config.ssh.username = "gns3"
	config.ssh.password = "gns3"
	config.ssh.port = "22"
end
