# /etc/puppet/modules/apt_sources/manifests/init.pp

class apt_sources {

  file { "/etc/apt/sources.list":
    owner   => "root",
    group   => "root",
    mode    => 644,
    source  => "puppet:///sources_list/sources.list",
  }
}
