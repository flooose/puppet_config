class packages::redis {
    if $hostname =~ /servercharlie.*/ {
            #notify{"GOT IN"}
        file {
            "/home/adva/builds/redis_1.02-1_i386.deb":
                ensure => present,
                       source => "puppet:///packages/redis_1.02-1_i386.deb";
        }
    } else {
        file {
            "/home/adva/builds/redis_1.02-1_amd64.deb":
                ensure => present,
                       source => "puppet:///packages/redis_1.02-1_amd64.deb";
        }
    }

    file {
        "/etc/redis.conf":
            ensure => present;
    }

    if $hostname =~ /servercharlie.*/ {
        package {
            "redis":
                require => File["/home/adva/builds/redis_1.02-1_i386.deb"],
                        source   => "/home/adva/builds/redis_1.02-1_i386.deb",
                        ensure => installed,
                        provider => dpkg;
        }
    } else {
        package {
            "redis":
                require => File["/home/adva/builds/redis_1.02-1_amd64.deb"],
                        source   => "/home/adva/builds/redis_1.02-1_amd64.deb",
                        ensure => installed,
                        provider => dpkg;
        }
    }
}
