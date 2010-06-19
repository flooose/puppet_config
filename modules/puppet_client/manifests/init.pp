class puppet_client {
    file {
        "/etc/init.d/puppet":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 644,
            source  => "puppet:///puppet_client/init.d/puppet";
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
        "/etc/logcheck.d.ignore/puppet":
            ensure  => present,
            owner   => "root",
            group   => "root",
            mode    => 644,
            source  => "puppet:///puppet_client/logcheck.d.server/puppet";
    }

#    service { 'puppet':
#        ensure     => running,
#        enable     => true,
#        require    => Exec["/opt/ruby-ee/bin/passenger-install-nginx-module --auto --prefix=/opt/nginx --auto-download"],
#    }

}
