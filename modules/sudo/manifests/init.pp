class sudo {

  # Ensures that this package is always up to date
  package { sudo: ensure => latest }

  file { "/etc/sudoers":
    owner => "root",
    group => "root",
    mode  => 440,
    source  => "puppet:///sudo/sudoers",
    require => Package["sudo"],
  }
}
