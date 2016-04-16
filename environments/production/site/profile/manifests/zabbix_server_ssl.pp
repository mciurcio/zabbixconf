class profile::zabbix_server_ssl {

  firewalld_port { 'zabbix http':
    ensure   => present,
    zone     => 'public',
    port     => 80,
    protocol => 'tcp',
  }

  firewalld_port { 'zabbix server':
    ensure   => present,
    zone     => 'public',
    port     => 10051,
    protocol => 'tcp',
  }

  include apache
  include apache::mod::prefork
  include apache::mod::php

  include postgresql::server

  package {'php-pgsql':
    ensure => present,
  }

  ini_setting {'date.timezone':
    ensure  => present,
    path    => '/etc/php.ini',
    section => 'date',
    setting => 'timezone',
    value   => 'America/Sao_Paulo'
  }

  file { '/etc/zabbix/ssl':
    ensure => directory,
  }

  file { '/etc/zabbix/ssl/server-key.pem':
    ensure => file,
    source => "/etc/puppetlabs/puppet/ssl/private_keys/${::fqdn}.pem",
  }

  file { '/etc/zabbix/ssl/server-cert.pem':
    ensure => file,
    source => "/etc/puppetlabs/puppet/ssl/certs/${::fqdn}.pem",
  }
    
  file { '/etc/zabbix/ssl/ca.pem':
    ensure => file,
    source => "/etc/puppetlabs/puppet/ssl/certs/ca.pem",
  }
  
  file { '/etc/zabbix/ssl/crl.pem':
    ensure => file,
    source => "/etc/puppetlabs/puppet/ssl/crl.pem",
  }

  class { 'zabbix':
    zabbix_url       => $::fqdn,
    manage_resources => true,
    tlscafile => '/etc/zabbix/ssl/ca.pem',
    tlscertfile => '/etc/zabbix/ssl/server-cert.pem',
    tlscrlfile => '/etc/zabbix/ssl/crl.pem',
    tlskeyfile => '/etc/zabbix/ssl/server-key.pem',
  }

}
