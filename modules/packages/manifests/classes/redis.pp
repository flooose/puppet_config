class redis {
    file {
        "/home/adva/builds/redis_1.02-1_i386.deb":
            ensure => present,
            source => "puppet:///redis/redis_1.02-1_i386.deb";
    }

    file {
        "/etc/redis.conf":
            ensure => present;
    }

    package {
        "redis":
            require => File["/home/adva/builds/redis_1.02-1_i386.deb"],
            source   => "/home/adva/builds/redis_1.02-1_i386.deb",
            ensure => installed,
            provider => dpkg;
    }
}
