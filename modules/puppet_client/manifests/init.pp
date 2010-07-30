class puppet_client {
    if $hostname =~ /^(S|s)erver(C|c)harlie.*/ {
        file {
            "/etc/init.d/puppet":
                ensure  => present,
                owner   => "root",
                group   => "root",
                mode    => 755,
                source  => "puppet:///puppet_client/init.d/puppet_sys_ruby";
        }
    } else {
        case $operatingsystem {
            ubuntu: {
                file {
                    "/etc/init.d/puppet":
                        ensure  => present,
                        owner   => "root",
                        group   => "root",
                        mode    => 755,
                        source  => "puppet:///puppet_client/init.d/puppet.ubuntu.init";
                }
            }
            debian: {
                file {
                    "/etc/init.d/puppet":
                        ensure  => present,
                        owner   => "root",
                        group   => "root",
                        mode    => 755,
                        source  => "puppet:///puppet_client/init.d/puppet_ree";
                }
            }
        }
    }

    file {
        "/etc/default/puppet":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 644,
            source  => "puppet:///puppet_client/default/puppet";
        "/etc/logrotate.d/puppet":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 644,
            source  => "puppet:///puppet_client/logrotate.d/puppet";
        "/etc/logcheck/ignore.d.server/puppet":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 644,
            source  => "puppet:///puppet_client/logcheck/ignore.d.server/puppet";
        "/etc/puppet/puppet.conf":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 644,
            source  => "puppet:///puppet_client/puppet/puppet.conf";
    }

    service { 'puppet':
        ensure     => running,
        enable     => true,
#        require    => Exec["/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download"],
    }

}
