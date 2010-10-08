class servercharlie::nginx {
    # the /etc/ files
    file {
        "/etc/init.d/nginx":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 755,
            source  => "puppet:///servercharlie/init.d/nginx";
        "/etc/logrotate.d/nginx":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 644,
            source  => "puppet:///servercharlie/logrotate.d/nginx";
    }
    # the htpasswd file
    file {
        "/opt/nginx/conf/ci.advabest":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 755,
            source  => "puppet:///servercharlie/nginx_conf/ci.advabest";
    }
    # directories for our configs
    file {
        "/opt/nginx/conf/sites-enabled":
            ensure  => directory,
            owner   => "root",
            group   => "root",
            mode    => 755;
        "/opt/nginx/conf/sites-available":
            ensure  => directory,
            owner   => "root",
            group   => "root",
            mode    => 755;
    }
    # the nginx configs
    file {
        "/opt/nginx/conf/nginx.conf":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 755,
            source  => "puppet:///servercharlie/nginx_conf/nginx.conf";
        "/opt/nginx/conf/sites-available/adva.nginx.conf":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 755,
            require => File["/opt/nginx/conf/sites-available"],
            source  => "puppet:///servercharlie/nginx_conf/sites-available/adva.nginx.conf";
        "/opt/nginx/conf/sites-available/advabest_demo.conf":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 755,
            require => File["/opt/nginx/conf/sites-available"],
            source  => "puppet:///servercharlie/nginx_conf/sites-available/advabest_demo.conf";
        "/opt/nginx/conf/sites-available/gem_server.nginx.conf":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 755,
            require => File["/opt/nginx/conf/sites-available"],
            source  => "puppet:///servercharlie/nginx_conf/sites-available/gem_server.nginx.conf";
        "/opt/nginx/conf/sites-available/redmine.nginx.conf":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 755,
            require => File["/opt/nginx/conf/sites-available"],
            source  => "puppet:///servercharlie/nginx_conf/sites-available/redmine.nginx.conf";
    }
    # now the links
    file {
        "/opt/nginx/conf/sites-enabled/adva.nginx.conf":
            ensure  => "/opt/nginx/conf/sites-available/adva.nginx.conf",
            owner   => "root",
            group   => "root",
            require => File["/opt/nginx/conf/sites-enabled", "/opt/nginx/conf/sites-available"],
            mode    => 755;
        "/opt/nginx/conf/sites-enabled/redmine.nginx.conf":
            ensure  => "/opt/nginx/conf/sites-available/redmine.nginx.conf",
            owner   => "root",
            group   => "root",
            require => File["/opt/nginx/conf/sites-enabled", "/opt/nginx/conf/sites-available"],
            mode    => 755;
        #"/opt/nginx/conf/sites-enabled/advabest_demo.conf":
        #    ensure  => "/opt/nginx/conf/sites-available/advabest_demo.conf",
        #    owner   => "root",
        #    group   => "root",
        #    require => File["/opt/nginx/conf/sites-enabled", "/opt/nginx/conf/sites-available"],
        #    mode    => 755;
        "/opt/nginx/conf/sites-enabled/gem_server.nginx.conf":
            ensure  => "/opt/nginx/conf/sites-available/gem_server.nginx.conf",
            owner   => "root",
            group   => "root",
            require => File["/opt/nginx/conf/sites-enabled", "/opt/nginx/conf/sites-available"],
            mode    => 755;
    }
}
