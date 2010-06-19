class nginx {
    file {
        "/etc/init.d/nginx":
            source => "puppet:///nginx/init.d/nginx";
        "/etc/logrotate.d/nginx":
            source => "puppet:///nginx/logrotate.d/nginx";
    }

    exec { "/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download":
        require   => Exec["/opt/ree.bash"],
        cwd       => "/opt",
        creates   => "/opt/nginx",
        logoutput => on_failure,
        onlyif    => "test -e /opt/ruby-ee/bin/ruby",
        timeout   => "-1",
        path      => "/opt:/opt/ruby-ee/bin:/opt/ruby-ee/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    }

    service { 'nginx':
        ensure     => running,
        enable     => true,
        require    => Exec["/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download"],
    }
}
