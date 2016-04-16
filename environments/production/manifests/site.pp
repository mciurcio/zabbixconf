node 'zabbix.instruct' {
  include profile::ssh
  include profile::zabbix_server
}

node /agent[0-9].instruct/ {
  include profile::ssh
  include profile::zabbix_agent
}

node 'master.instruct' {
  include profile::puppet_master
}
