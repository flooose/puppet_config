class nginx {
## The nginx module should only install nginx. ALL
## configuration files should be installed by the
## various modules that use nginx.
#    file {
#        "/etc/init.d/nginx":
#            ensure  => present,
#            owner   => "root",
#            group   => "root",
#            mode    => 644,
#            source  => "puppet:///nginx/init.d/nginx";
#        "/etc/logrotate.d/nginx":
#            ensure  => present,
#            owner   => "root",
#            group   => "root",
#            mode    => 644,
#            source  => "puppet:///nginx/logrotate.d/nginx";
#    }
#
    exec { "/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download --extra-configure-flags='--with-http_ssl_module'":
        require   => Exec["/opt/ree.bash"],
        cwd       => "/opt",
        creates   => "/opt/nginx",
        logoutput => true,
        onlyif    => "test -e /opt/ruby-ee/bin/ruby",
        timeout   => "-1",
        path      => "/opt:/opt/ruby-ee/bin:/opt/ruby-ee/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    }

## This service should also be managage by individual
## module, since a "service" is nothing without its init
## scripts.
#    service { "nginx":
#        require    => Exec["/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download --extra-configure-flags='--with-http_ssl_module'"],
#        #ensure     => running,
#        enable     => true,
#    }
#
## And this mess definitely needs to be in the ext-con
## module
    if $hostname == "ext-con-sk-test" {
        file {
            # main nginx: /opt/nginx/nginx.conf
            "/opt/nginx/conf/nginx.conf":
                require    => Exec["/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download --extra-configure-flags='--with-http_ssl_module'"],
                source => "puppet:///nginx/con-test/nginx.conf.con.test";

            # htaccess
            "/opt/nginx/conf/staging.sk.htpasswd":
                source => "puppet:///nginx/con-test/staging.sk.htpasswd";
                
            # Sites available
            "/opt/nginx/conf/sites-available/demo.ext-con-sk-test.siewert-kau.de":
                source => "puppet:///nginx/con-test/demo.ext-con-sk-test.siewert-kau.de";
            "/opt/nginx/conf/sites-available/ext-con-sk-test.siewert-kau.de":
                source => "puppet:///nginx/con-test/ext-con-sk-test.siewert-kau.de";

            # Sites enabled
            "/opt/nginx/conf/sites-enabled/demo.ext-con-sk-test.siewert-kau.de":
                ensure => "/opt/nginx/conf/sites-available/demo.ext-con-sk-test.siewert-kau.de",
                require => File["/opt/nginx/conf/sites-available/demo.ext-con-sk-test.siewert-kau.de"];
            "/opt/nginx/conf/sites-enabled/ext-con-sk-test.siewert-kau.de":
                ensure => "/opt/nginx/conf/sites-available/ext-con-sk-test.siewert-kau.de",
                require => File["/opt/nginx/conf/sites-available/ext-con-sk-test.siewert-kau.de"];
        }
    }
}
