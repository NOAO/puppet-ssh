class ssh::config {
  include ssh::params

  File {
    owner   => 'root',
    group   => 'root',
  }

  sshd_config { 'PermitRootLogin':
    ensure => present,
    value  => 'without-password',
  }

  sshd_config { 'X11Forwarding':
    ensure => present,
    value  => 'yes',
  }

  sshd_config { 'X11UseLocalhost':
    ensure => present,
    value  => 'no',
  }

  sshd_config { 'MaxStartups':
    ensure => present,
    value  => '1024',
  }

  # GPFS requires no motd/etc. is printed by ssh
  # XXX confine this to just the root user?
  sshd_config { 'PrintMotd':
    ensure => present,
    value  => 'no',
  }

  sshd_config { 'PrintLastLog':
    ensure => present,
    value  => 'no',
  }

  file { $ssh::params::ssh_client_config:
    ensure  => present,
    mode    => '0644',
    source  => "puppet:///modules/ssh/${ssh::params::ssh_client_config_source}",
    require => Class['ssh::install'],
    notify  => Class['ssh::service'],
  }
}
