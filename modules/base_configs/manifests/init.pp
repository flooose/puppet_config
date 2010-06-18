# /etc/puppet/modules/base_configs/manifests/init.pp

class base_configs {
  # System-wide bash config
  file { "/etc/bash.bashrc": source  => "puppet:///base_configs/bash.bashrc", }

  # System-wide profile config
  file { "/etc/profile": source  => "puppet:///base_configs/profile", }

  # inputrc for the coveted history-search-backward
  file { "/etc/inputrc": source  => "puppet:///base_configs/inputrc", }

  # Keep sudoers just right make sure sudo is installed
  package { sudo: ensure => latest }
  file { "/etc/sudoers":
    owner => "root",
    group => "root",
    mode  => 440,
    source  => "puppet:///base_configs/sudoers",
    require => Package["sudo"],
  }

  # apt sources updated to allow installation from backports
  file { "/etc/apt/sources.list":
    owner   => "root",
    group   => "root",
    mode    => 644,
    source  => "puppet:///base_configs/sources.list",
  }

  # Every system user has the same ssh aliases, so let's 
  # centralize them
  file { "/etc/ssh/ssh_config":
    owner   => "root",
    group   => "root",
    mode    => 644,
    source  => "puppet:///base_configs/ssh_config",
  }

}
