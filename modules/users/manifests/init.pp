# /etc/puppet/modules/users/manifests/init.pp

define adva_users($username){
    group { "$username":
            name            => "$username",
            ensure          => present,
    }

    user { "$username": name => "$username",
            gid             => "$username",
            managehome      => true,
            home            => "/home/$username",
            shell           => "/bin/bash",
            ensure          => present,
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

define hudson_user($username){
    user { "$username": name => "$username",
            managehome      => true,
            groups          => "nogroup",
            home            => "/var/lib/$username",
            ensure          => present,
    }

    file { "/var/lib/hudson/.ssh":
            ensure  => directory,
            group   => "nogroup",
            owner   => "$username",
            mode    => "755",
    }
    
    file { "/var/lib/$username/.ssh/authorized_keys":
            ensure  => file,
            owner   => "$username",
            group   => "nogroup",
            mode    => "644",
            source  => "puppet:///base_configs/authorized_keys",
    }
}

class application {
    file {
        "/home/application/.profile":
            source => "puppet:///base_configs/apt/application_profile";
    }
}
