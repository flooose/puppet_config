# /etc/puppet/manifests/nodes.pp

# What all nodes include. Here we should have:
# 1. /etc/bash.bashrc
# 2. /etc/inputrc
# 3. /home/#{user}/.bashrc
# 4. /home/#{user}/.ssh/*
# 5. ....
node default {
    #include bashrc
    #include sudo
    #include somefile
    #include apt_sources
    #include inputrc
    include base_packages 
    include base_configs
    adva_users{"application": username => "application"}
    adva_users("adva": username => "adva" )

}

# Blueprint for potential future nodes.
node 'b2c.test' inherits default {

}

# Test node for sktest
node 'ext-con-sk-test.siewert-und-kau' inherits default{

}
