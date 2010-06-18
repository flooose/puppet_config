class ree {
    file { "/opt/ree.bash":
        ensure => present,
        source => "puppet:///ree/ree.bash",
        mode   => 755,
    }

    exec { "/opt/ree.bash":
        cwd       => "/opt",
        creates   => "/opt/ruby-ee/bin/ruby",
        logoutput => on_failure,
        timeout   => "-1",
        path      => "/opt:/opt/ruby-ee/bin:/opt/ruby-ee/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    }

    exec { "/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download":
        cwd       => "/opt",
        creates   => "/opt/nginx",
        logoutput => on_failure,
        onlyif    => "test -e /opt/ruby-ee/bin/ruby",
        timeout   => "-1",
        path      => "/opt:/opt/ruby-ee/bin:/opt/ruby-ee/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    }
}
