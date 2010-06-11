# /etc/puppet/modules/ssh_user_config/manifests/init.pp

class bashrc {

  file { "/etc/bash.bashrc":
    owner => "root",
    group => "root",
    #(this probably doesn't work yet) source  => "puppet:///bashrc/bash.bashrc",
    require => Package["bash"],
  }
}
