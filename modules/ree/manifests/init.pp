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
        path      => "/opt:/opt/ruby_ee/bin:/opt/ruby_ee/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    }
}
