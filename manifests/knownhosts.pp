class ssh::knownhosts {
  #Sshkey <<| |>> { ensure => present, require => Class['ssh::service'] }
  Sshkey <<| |>> { ensure => present }
}
