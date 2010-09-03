# /etc/puppet/modules/users/manifests/init.pp

## TODO: Are users created without passwords?
define ext-con::adva_users($username){

#    group { "$username":
#        name            => "$username",
#        ensure          => present,
#    }
#
#    user { "$username": name => "$username",
#        gid             => "$username",
#        managehome      => true,
#        home            => "/home/$username",
#        shell           => "/bin/bash",
#        ensure          => present,
#    }

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
    file { "/home/$username/.bashrc":
        ensure  => file,
        group   => "$username",
        owner   => "$username",
        mode    => "644",
        source  => "puppet:///base_configs/user.bashrc",
    }
}

#class application {
#    file {
#        "/home/application/.profile":
#            source => "puppet:///base_configs/apt/application_profile";
#    }
#}
