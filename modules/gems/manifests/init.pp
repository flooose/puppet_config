# /etc/puppet/modules/gems/manifests/init.pp

class gems {
    package { 
        "god":
            provider => gem,
            ensure => installed;
        "rake":
            provider => gem,
            ensure => installed;
	"rails":
            provider => gem,
            #ensure => "--pre";
    }
}
