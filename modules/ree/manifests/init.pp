class ree {
    file { "/opt/ree.bash":
        ensure => present,
        source => "puppet:///ree/ree.bash",
    }
    exec { "/opt/ree.bash":
        cwd       => "/opt",
        creates   => "/opt/ruby-ee/bin/ruby",
        logoutput => on_failure,
        onlyif    => "test -d /opt/ruby-ee && test -e /opt/ruby-ee/bin/ruby"
        path      => "/opt/ruby_ee/bin:/opt/ruby_ee/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    }
}
