# /etc/puppet/modules/inputrc/manifests/init.pp

class inputrc {

  file { "/etc/inputrc":
    owner => "root",
    group => "root",
    source  => "puppet:///inputrc/inputrc",
  }
}
