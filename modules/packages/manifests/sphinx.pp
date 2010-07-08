# file /etc/puppet/modules/sphinx/manifests/init.pp

class sphinx {
    file {
        "/home/adva/builds/sphinx_0.9.9-1_amd64.deb":
            ensure => present,
            source   => "puppet:///sphinx/sphinx_0.9.9-1_amd64.deb";
    }
            
    package {
        "sphinx":
            require => File["/home/adva/builds/sphinx_0.9.9-1_amd64.deb"],
            source   => "/home/adva/builds/sphinx_0.9.9-1_amd64.deb",
            ensure => installed,
            provider => dpkg;
    }
}
