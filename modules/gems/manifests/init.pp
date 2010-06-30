# /etc/puppet/modules/gems/manifests/init.pp

class gems_sk_all {
    package { 
        "god":
            provider => gem,
            ensure => installed;
        "rake":
            provider => gem,
            ensure => installed;
    }
}

class gems_b2c_base {
    package {
        "pg":
            provider => gem,
            ensure => installed;
        "rack":
            provider => gem,
            ensure => installed;
        "rails":
            provider => gem,
            ensure => "3.0.0.beta4";
    }
}
