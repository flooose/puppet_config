class bashrc {

  file { "/etc/bash.bashrc":
    source  => "puppet:///bashrc/bash.bashrc",
  #  require => Package["bash"],
  }
}
