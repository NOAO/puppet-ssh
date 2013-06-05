class ssh::uninstall {
  include ssh::params

  package { $ssh::params::ssh_package_name:
    ensure => absent,
  }
}
