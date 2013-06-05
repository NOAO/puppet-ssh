class ssh::config {
  include ssh::params

  File {
    owner   => 'root',
    group   => 'root',
  }

  file { $ssh::params::ssh_service_config:
    ensure  => present,
    mode    => '0600',
    source  => "puppet:///modules/ssh/${ssh::params::ssh_service_config_source}",
    require => Class['ssh::install'],
    notify  => Class['ssh::service'],
  }

  file { $ssh::params::ssh_client_config:
    ensure  => present,
    mode    => '0600',
    source  => "puppet:///modules/ssh/${ssh::params::ssh_client_config_source}",
    require => Class['ssh::install'],
    notify  => Class['ssh::service'],
  }
}
