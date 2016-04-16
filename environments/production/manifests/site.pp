node 'zabbix.instruct' {
  include profile::zabbix_server
  #include profile::zabbix_server_ssl
}

node /agent[0-9].instruct/ {
  include profile::zabbix_agent
  #include profile::zabbix_agent_ssl
}

node 'master.instruct' {
  include profile::puppet_master
}
