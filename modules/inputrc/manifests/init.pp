# /etc/puppet/modules/inputrc/manifests/init.pp

class bashrc {

  file { "/etc/inputrc":
    owner => "root",
    group => "root",
    #(this probably doesn't work yet) source  => "puppet:///bashrc/bash.bashrc",
  }
}
