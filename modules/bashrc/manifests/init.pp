class bashrc {

  # Ensures that this package is always up to date
  package { bash: ensure => latest }

  file { "/etc/bash.bashrc":
    owner => "root",
    group => "root",
    source  => "puppet:///bashrc/bash.bashrc",
    require => Package["bash"],
  }
}
