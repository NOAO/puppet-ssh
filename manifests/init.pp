class ssh {
  include ssh::install, ssh::config, ssh::service, ssh::hostkeys, ssh::knownhosts
  #include ssh::install, ssh::config, ssh::service
}
