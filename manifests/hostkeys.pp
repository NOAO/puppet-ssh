class ssh::hostkeys {
#  $require = Class['ssh::service']
  # export the host keys.  It doesn't matter the order this happens in as
  # facter runs before any of the puppet code so even if the keys just
  # appeared, they won't be visible as facts until the next run.
  if $::sshdsakey {
    @@sshkey { "${::fqdn}_dsa":
      host_aliases  => [ $::fqdn, $::hostname, $::ipaddress ],
      type          => dsa,
      key           => $::sshdsakey,
    }
  }

  if $::sshrsakey {
    @@sshkey { "${::fqdn}_rsa":
      host_aliases  => [ $::fqdn, $::hostname, $::ipaddress ],
      type          => rsa,
      key           => $::sshrsakey,
    }
  }
}
