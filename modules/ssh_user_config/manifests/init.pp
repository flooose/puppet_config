# /etc/puppet/modules/ssh_user_config/manifests/init.pp

class ssh_user_config {

  file { "/home/adva/.ssh/config":
    #(this probably doesn't work yet) source  => "puppet:///bashrc/bash.bashrc",
  }
}
