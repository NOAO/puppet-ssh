class ssh::service {
  include ssh::params

  # on first boot of a new host, sshd needs to be started before host keys can
  # be harvested.
  service { $ssh::params::ssh_service_name:
    ensure      => running,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class['ssh::config'],
  }
}
