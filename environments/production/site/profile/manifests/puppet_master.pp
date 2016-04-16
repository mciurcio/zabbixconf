class profile::puppet_master {
  $server_java_opts = '-Xms512m -Xmx512m'

  firewalld_port { 'puppet master':
    ensure   => present,
    zone     => 'public',
    port     => 8140,
    protocol => 'tcp',
  }

  firewalld_port { 'puppetdb':
    ensure   => present,
    zone     => 'public',
    port     => 8081,
    protocol => 'tcp',
  }

  # Bug relacionado: https://tickets.puppetlabs.com/browse/SERVER-557
  file {'/etc/systemd/system/puppetserver.service.d':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file {'/etc/systemd/system/puppetserver.service.d/local.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "[Service]\nTimeoutStartSec=300\n",
  }

  contain puppetdb

  include puppetdb::master::config

  

}
