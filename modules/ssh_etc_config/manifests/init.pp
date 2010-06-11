# /etc/puppet/modules/ssh_user_config/manifests/init.pp

class ssh_etc_config {

  file { "/etc/ssh/ssh_config":
    owner   => "root",
    group   => "root",
    mode    => 644,
    source  => "puppet:///ssh_etc_config/ssh_config",
  }
}
