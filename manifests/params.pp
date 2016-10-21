class ssh::params {
  $ssh_service_config = '/etc/ssh/sshd_config'
  $ssh_client_config  = '/etc/ssh/ssh_config'
  $ssh_known_hosts    = '/etc/ssh/ssh_known_hosts'

  case $::operatingsystem {
    Solaris: {
      $ssh_package_name = 'openssh'
      $ssh_service_name = 'sshd'
      $ssh_service_config_source = 'sshd_config'
    }
    /(Ubuntu|Debian)/: {
      $ssh_package_name = 'openssh-server'
      $ssh_service_name = 'ssh'
      $ssh_service_config_source = 'sshd_config'
    }
    /(RedHat|CentOS|Scientific|Fedora)/: {
      # need xauth for X11 forwarding
      $ssh_package_name = ['openssh-server', 'socat', 'xorg-x11-xauth']
      $ssh_service_name = 'sshd'

      case $::lsbmajdistrelease {
        6: {
          $ssh_service_config_source = 'sshd_config.el6'
          $ssh_client_config_source  = 'ssh_config.el6'
        }
        default: {
          $ssh_service_config_source = 'sshd_config.el5'
          $ssh_client_config_source  = 'ssh_config.el5'
        }
      }
    }
    Gentoo: {
      $ssh_package_name = [
        'net-misc/openssh',
        'net-analyzer/netcat6',
        'net-misc/socat',
      ]
      $ssh_service_name = 'sshd'
      $ssh_service_config_source = 'sshd_config'
    }
    default: {
      $ssh_package_name = 'openssh'
      $ssh_service_name = 'sshd'
      $ssh_service_config_source = 'sshd_config'
    }
  }
}
