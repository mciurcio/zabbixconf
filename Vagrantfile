# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.define "zabbix" do |zabbix|
    zabbix.vm.hostname = "zabbix.instruct"
    zabbix.vm.box = "puppetlabs/centos-7.0-64-puppet"
    zabbix.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.cpus = 2
      v.memory = 2048
    end
    config.vm.provision "puppet" do |puppet|
      puppet.environment_path = "environments"
      puppet.environment = "production"
    end
  end

end
