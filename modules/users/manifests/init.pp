# /etc/puppet/modules/users/manifests/init.pp

# TODO: Are users created without passwords?
define adva_users($username, $password){
    group { "$username":
        name            => "$username",
        ensure          => present,
    }

    user { "$username": name => "$username",
        manages_password => true,
        password         => $password,
        gid              => "$username",
        managehome       => true,
        home             => "/home/$username",
        password         => '',
        shell            => "/bin/bash",
        ensure           => present,
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
