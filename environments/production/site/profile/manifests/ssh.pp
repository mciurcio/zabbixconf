class profile::ssh {

  ssh_authorized_key { 'root@master.instruct':
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCzP137kfYUA7/8Xss0cMH2c+nSuccGB9PKhriqZ+fabI8Nhewk83J10maSKEs7AXCVEnvyBL5g8gtkaHaQVJt+1MgFOReQ4o/uZXFEB5q9lxWMjPWSvfHGGNPhHOi1LNZlrwjbwyvluGME0u5wL5u96ekJPMacayAjEZxJUY3Cr8lzsoqWsJF7ja4GLZZqbhhU+Laam7WiKr+BVN8eg5nc2C2YyBT8xAK+jzMQQf8o8e43K7Cgh8jyf09IFDHEwpJgWP8RDFcFluRRSLqFGyYPqetvIuLVZp8jZ5s384ODNbjRyhfrdZ9YIPicDDg79vKtUHerpAEgOdbPbdNgswZV',
    user => 'root',
    type => 'ssh-rsa',
  }

}
