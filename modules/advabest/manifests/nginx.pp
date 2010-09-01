class advabest::nginx {
    # the /etc/ files
    file {
        "/etc/init.d/nginx":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 755,
            source  => "puppet:///advabest/init.d/nginx";
        "/etc/logrotate.d/nginx":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 644,
            source  => "puppet:///advabest/logrotate.d/nginx";
    }

    # Module ree needs to be refactored at some point.
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
        enable     => true,
    }

    file {
        # main nginx: /opt/nginx/nginx.conf
        "/opt/nginx/conf/nginx.conf":
            require    `=> Exec["/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download --extra-configure-flags='--with-http_ssl_module'"],
            source      => "puppet:///advabest/nginx_conf/nginx.conf";

        # htaccess
        "/opt/nginx/conf/staging.sk.htpasswd":
            source      => "puppet:///advabest/nginx_conf/staging.sk.htpasswd";

        # Sites-available
        "/opt/nginx/conf/sites-available":
            ensure      => directory;
        "/opt/nginx/conf/sites-available/advabest.staging":
            replace     => false,
            source      => "puppet:///advabest/nginx_conf/sites-available/advabest.staging";
        "/opt/nginx/conf/sites-available/advabest.production":
            replace     => false,
            source      => "puppet:///advabest/nginx_conf/sites-available/advabest.production";
        "/opt/nginx/conf/sites-available/intranet.advabest.com":
            replace     => false,
            source      => "puppet:///advabest/nginx_conf/sites-available/intranet.advabest.com";

        # Sites-enabled
        "/opt/nginx/conf/sites-enabled":
            ensure      => directory;
        "/opt/nginx/conf/sites-enabled/advabest.staging":
            ensure      => "/opt/nginx/conf/sites-available/advabest.staging",
            require     => File["/opt/nginx/conf/sites-available/advabest.staging"];
        "/opt/nginx/conf/sites-enabled/advabest.production":
            ensure      => "/opt/nginx/conf/sites-available/advabest.production",
            require     => File["/opt/nginx/conf/sites-available/advabest.production"];
        "/opt/nginx/conf/sites-enabled/intranet.advabest.com":
            ensure      => "/opt/nginx/conf/sites-available/advabest.production",
            require     => File["/opt/nginx/conf/sites-available/intranet.advabest.com"];
    }
}
