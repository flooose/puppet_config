# /etc/puppet/modules/base_configs/manifests/init.pp

class base_configs {
    file {
        # System-wide bash config
        "/etc/bash.bashrc":
            source  => "puppet:///base_configs/bash.bashrc";
        # System-wide profile config
        "/etc/profile":
            source  => "puppet:///base_configs/profile";
        # inputrc for the coveted history-search-backward
        "/etc/inputrc":
            source  => "puppet:///base_configs/inputrc";
        # Keep sudoers just right make sure sudo is installed
        "/etc/sudoers":
            owner => "root",
            group => "root",
            mode  => 440,
            source  => "puppet:///base_configs/sudoers",
            require => Package["sudo"];
        # apt sources updated to allow installation from backports
        "/etc/apt/sources.list":
            owner   => "root",
            group   => "root",
            mode    => 644,
            source  => "puppet:///base_configs/sources.list";
        # Every system user has the same ssh aliases, so let's 
        # centralize them
        "/etc/ssh/ssh_config":
            owner   => "root",
            group   => "root",
            mode    => 644,
            source  => "puppet:///base_configs/ssh_config",
    }
}

class b2c_base_configs {
    file {
        "/etc/apt/preferences":
            source => "puppet:///base_configs/apt/preferences_b2c";
    }
}
