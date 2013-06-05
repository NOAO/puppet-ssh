class ssh {
  include ssh::install, ssh::config, ssh::service
  include ssh::hostkeys, ssh::knownhosts
}
