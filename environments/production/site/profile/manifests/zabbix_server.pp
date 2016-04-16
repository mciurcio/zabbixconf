class profile::zabbix_server {

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

  class { 'zabbix':
    zabbix_url       => $::fqdn,
    manage_resources => false,
  }

}
