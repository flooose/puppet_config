# /etc/puppet/modules/groups/manifests/init.pp

define adva_groups($groupname){
    group { "$groupname": name => "$groupname",
		        ensure => present,
    }
}
