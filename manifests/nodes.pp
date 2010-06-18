# /etc/puppet/manifests/nodes.pp

# What all nodes include. Here we should have:
# 1. /etc/bash.bashrc
# 2. /etc/inputrc
# 3. /home/#{user}/.bashrc
# 4. /home/#{user}/.ssh/*
# 5. ....
node default {
    include base_packages 
    include base_configs
    adva_users{"adva": username => "adva" }

}

# Blueprint for potential future nodes.
node 'ext-b2c-sk-test' inherits default {
    include gems
    include ree
    adva_users{"application": username => "application"}

    exec { "/opt/ree.bash":
        cwd       => "/opt",
        creates   => "/opt/ruby-ee/bin/ruby",
        logoutput => on_failure,
        onlyif    => "test -d /opt/ruby-ee && test -e /opt/ruby-ee/bin/ruby",
        path      => "/opt:/opt/ruby_ee/bin:/opt/ruby_ee/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    }
}

# Test node for sktest
node 'ext-con-sk-test.siewert-und-kau' inherits default{

}
