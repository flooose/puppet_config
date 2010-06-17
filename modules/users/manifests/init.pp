# /etc/puppet/modules/users/manifests/init.pp

# TODO: Are users created without passwords?
define adva_users($username){
    user { "$username": name => "$username",
        gid             => "$username",
        managehome      => true,
        home            => "/home/$username",
        password        => '',
        shell           => "/bin/bash",
        ensure          => present,
        require         => Group["$username"]
    }

    file { "/home/$username/.ssh":
        ensure  => directory,
        group   => "$username",
        owner   => "$username",
        mode    => "755",
    }
    
    file { "/home/$username/.ssh/authorized_keys":
        ensure  => file,
        group   => "$username",
        owner   => "$username",
        mode    => "644",
        source  => "puppet:///base_configs/authorized_keys",
    }
}
