# /etc/puppet/manifests/nodes.pp

# What all nodes include. Here we should have:
# 1. /etc/bash.bashrc
# 2. /etc/inputrc
# 3. /home/#{user}/.bashrc
# 4. /home/#{user}/.ssh/*
# 5. ....
node default {
    include puppet
    include base_packages 
    include base_configs
    adva_users{"adva": username => "adva"
    }
}

# Blueprint for potential future nodes.
node 'ext-b2c-sk-test' inherits default {
    include gems
    include ree
    include nginx
    adva_users{"application": username => "application"}
}

# Test node for sktest
node 'ext-con-sk-test.siewert-und-kau' inherits default{

}
