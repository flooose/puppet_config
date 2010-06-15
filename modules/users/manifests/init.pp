# /etc/puppet/modules/users/manifests/init.pp

define user($username){
    user { "$username": name => "$username",
                      groups => "$username",
           manages_passwords => true,
                    password => '',
                       shell => bash,
    }
}
