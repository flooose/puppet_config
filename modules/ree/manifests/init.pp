class ree {
    file { "/opt/ree.bash":
        ensure => present,
        source => "puppet:///ree/ree.bash",
        mode   => 755,
    }
}
