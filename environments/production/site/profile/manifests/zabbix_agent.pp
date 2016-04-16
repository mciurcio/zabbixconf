class profile::zabbix_agent {

  firewalld_port { 'zabbix agent':
    ensure   => present,
    zone     => 'public',
    port     => 10050,
    protocol => 'tcp',
  }

  class { 'zabbix::agent':
    manage_resources    => true,
    server              => 'zabbix.instruct',
    serveractive        => 'zabbix.instruct',
    refreshactivechecks => '60',
    listenip            => $::ipaddress_enp0s8,
    zbx_templates       => ['Template ICMP Ping', 'Template App Zabbix Agent'],
  }

}
