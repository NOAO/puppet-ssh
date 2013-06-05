class ssh::install {
  include ssh::params

  package { $ssh::params::ssh_package_name:
    ensure => latest,
  }
}
