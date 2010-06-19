class nginx {
    file {
        "/etc/init.d/nginx":
            source => "puppet:///passenger_nginx/init.d/nginx";
        "/etc/default/nginx":
            source => "puppet:///passenger_nginx/logrotate.d/nginx";
    }

    exec { "/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download":
        require   => Exec["/opt/ree.bash"]
        cwd       => "/opt",
        creates   => "/opt/nginx",
        logoutput => on_failure,
        onlyif    => "test -e /opt/ruby-ee/bin/ruby",
        timeout   => "-1",
        path      => "/opt:/opt/ruby-ee/bin:/opt/ruby-ee/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    }
}
