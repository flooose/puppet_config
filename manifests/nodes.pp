# /etc/puppet/manifests/nodes.pp

# The bare minimum, all machines are clients, have adva user,
# and need the basic configs
node default {
    include puppet_client
    include base_configs
    adva_users{"adva": username => "adva",}
}

# The puppetmasterd node should inherit default and then have
# directives specific to being a master.
node 'servercharlie.bestgroup' {
    include puppet_client
    adva_users{"puppet-admin": username => "puppet-admin",}
}

# TODO: change this node name to be a regex for all s-k
# machines, make this the foundation for all s-k machines
# and refactor base_packages to sk_base_packages, i.e. only
# those packages commen to all of s-k
node 'ext-b2c-sk-test' inherits default {
    include base_packages
    include gems
    include ree
    include nginx
    adva_users{"application": username => "application",}
}

# Test node for sktest
node 'ext-con-sk-test' {
    include puppet_client

}
