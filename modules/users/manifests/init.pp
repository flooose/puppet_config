# /etc/puppet/modules/users/manifests/init.pp

# TODO: Are users created without passwords?
define user($username){
    user { "$username": name => "$username",
                      groups => "$username",
           manages_passwords => true,
                    password => '',
                       shell => bash,
    }
    
    file { "/home/$username/.ssh/authorized_keys":
        ensure  => file,
        recurse => true,
        group   => "$username",
        owner   => "$username",
        mode    => "644",
        source  => "puppet:///base_configs/authorized_keys",
    }
}
