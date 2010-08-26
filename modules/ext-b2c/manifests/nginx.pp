class ext-b2c::nginx {
    # TODO: should this be gone? It gets installed by the package,
    # but it might be better leave this so too ensure that it
    # persists, especially since there is nothing server specific
    # here.
    file {
        "/etc/init.d/nginx":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 755,
            source  => "puppet:///ext-b2c/init.d/nginx";
        "/etc/logrotate.d/nginx":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 644,
            source  => "puppet:///ext-b2c/logrotate.d/nginx";
    }

    exec { "/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download --extra-configure-flags='--with-http_ssl_module'":
        require   => Exec["/opt/ree.bash"],
        cwd       => "/opt",
        creates   => "/opt/nginx",
        logoutput => true,
        onlyif    => "test -e /opt/ruby-ee/bin/ruby",
        timeout   => "-1",
        path      => "/opt:/opt/ruby-ee/bin:/opt/ruby-ee/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    }

    service { "nginx":
        require    => Exec["/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download --extra-configure-flags='--with-http_ssl_module'"],
        #ensure     => running,
        enable     => true,
    }

    file {
        # main nginx: /opt/nginx/nginx.conf
        "/opt/nginx/conf/nginx.conf":
            require    => Exec["/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download --extra-configure-flags='--with-http_ssl_module'"],
            source => "puppet:///ext-b2c/b2c-test/b2c-test.nginx.conf";

        # htaccess
        "/opt/nginx/conf/staging.sk.htpasswd":
            source => "puppet:///ext-b2c/b2c-test/staging.sk.htpasswd";

        # Sites available
        "/opt/nginx/conf/sites-available":
            ensure => directory;
        "/opt/nginx/conf/sites-available/ext.b2c.sk.test":
            source => "puppet:///ext-b2c/b2c-test/ext.b2c.sk.test";

        # Sites enabled
        "/opt/nginx/conf/sites-enabled":
            ensure => directory;
        "/opt/nginx/conf/sites-enabled/ext.b2c.sk.test":
            ensure => "/opt/nginx/conf/sites-available/ext.b2c.sk.test",
            require => File["/opt/nginx/conf/sites-available/ext.b2c.sk.test"];
    }
}
