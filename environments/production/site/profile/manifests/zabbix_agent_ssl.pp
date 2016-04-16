class profile::zabbix_agent_ssl {

  File {
    notify => Service['zabbix-agent']
  }

  firewalld_port { 'zabbix agent':
    ensure   => present,
    zone     => 'public',
    port     => 10050,
    protocol => 'tcp',
  }

  file { '/etc/zabbix/ssl':
    ensure => directory,
  }

  file { '/etc/zabbix/ssl/agent-key.pem':
    ensure => file,
    source => "/etc/puppetlabs/puppet/ssl/private_keys/${::fqdn}.pem",
  }

  file { '/etc/zabbix/ssl/agent-cert.pem':
    ensure => file,
    source => "/etc/puppetlabs/puppet/ssl/certs/${::fqdn}.pem",
  }

  file { '/etc/zabbix/ssl/ca.pem':
    ensure => file,
    source => '/etc/puppetlabs/puppet/ssl/certs/ca.pem',
  }

  file { '/etc/zabbix/ssl/crl.pem':
    ensure => file,
    source => '/etc/puppetlabs/puppet/ssl/crl.pem',
  }

  class { 'zabbix::agent':
    manage_resources => true,
    server           => 'zabbix.instruct',
    serveractive     => 'zabbix.instruct',
    listenip         => $::ipaddress_enp0s8,
    zbx_templates    => ['Template ICMP Ping', 'Template App Zabbix Agent'],
    tlsaccept        => 'cert',
    tlsconnect       => 'cert',
    tlscafile        => '/etc/zabbix/ssl/ca.pem',
    tlscertfile      => '/etc/zabbix/ssl/agent-cert.pem',
    tlscrlfile       => '/etc/zabbix/ssl/crl.pem',
    tlskeyfile       => '/etc/zabbix/ssl/agent-key.pem',
  }

}
