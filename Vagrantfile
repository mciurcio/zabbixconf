# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.define "master" do |master|
    master.vm.hostname = "master.instruct"
    master.vm.box = "puppetlabs/centos-7.0-64-puppet"
    master.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.cpus = 2
      v.memory = 2048
    end
    master.vm.synced_folder "environments", "/etc/puppetlabs/code/environments"
    master.vm.network "private_network", ip: "192.168.200.10", :name => "vboxnet0", :adapter => 2
  end

  config.vm.define "zabbix" do |zabbix|
    zabbix.vm.hostname = "zabbix.instruct"
    zabbix.vm.box = "puppetlabs/centos-7.0-64-puppet"
    zabbix.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.cpus = 2
      v.memory = 2048
    end
    zabbix.vm.network "private_network", ip: "192.168.200.11", :name => "vboxnet0", :adapter => 2
  end
  
  config.vm.define "agent1" do |agent1|
    agent1.vm.hostname = "agent1.instruct"
    agent1.vm.box = "puppetlabs/centos-7.0-64-puppet"
    agent1.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.cpus = 1
      v.memory = 512
    end
    agent1.vm.network "private_network", ip: "192.168.200.12", :name => "vboxnet0", :adapter => 2
  end

  config.vm.define "agent2" do |agent2|
    agent2.vm.hostname = "agent2.instruct"
    agent2.vm.box = "puppetlabs/centos-7.0-64-puppet"
    agent2.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.cpus = 1
      v.memory = 512
    end
    agent2.vm.network "private_network", ip: "192.168.200.13", :name => "vboxnet0", :adapter => 2
  end

end
