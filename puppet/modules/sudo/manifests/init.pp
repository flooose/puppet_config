class sudo {
  module_home=#"puppet/modules/sudo/manifests"

  # Ensures that this package is always up to date
  package { sudo: ensure => latest }

  file { "/etc/sudoers":
    owner => "root",
    group => "root",
    mode  => 440,
    #(this probably doesn't work yet) source  => "puppet:///sudo/sudoers",
    require => Package["sudo"],
  }
}
