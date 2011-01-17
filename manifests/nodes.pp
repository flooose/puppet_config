# /etc/puppet/manifests/nodes.pp

# The bare minimum, all machines are clients, have adva user,
# and need the basic configs
node default {
    include puppet_client
    include base_configs
    include base_packages::base_all
    adva_users{"adva": username => "adva",}
    adva_users{"application": username => "application",}
    hudson_user{"hudson": username => "hudson",}
}

# The puppetmasterd node should inherit default and then have
# directives specific to being a master.
node 'servercharlie.bestgroup' inherits default {
    # TODO: Refactor. Charlie needs postgres stuff, but it shouldn't be
    # named in b2c_test
    include servercharlie::nginx
    include servercharlie::configs
    include servercharlie::packages
    adva_users{"puppet-admin": username => "puppet-admin",}
}

# TODO: change this node name to be a regex for all s-k
# machines, make this the foundation for all s-k machines
# and refactor base_packages to sk_base_packages, i.e. only
# those packages commen to all of s-k
node 'ext-b2c-sk-test' inherits default {
    include base_packages::b2c_test
    include b2c_base_configs
    include base_packages::sk_base
    include gems_sk_all
    include packages::redis
    include ext-b2c::nginx
    include packages::sphinx
}

# Test node for sktest
node 'ext-con-sk-test' {
    #include puppet_client
    include base_configs
    ext-con::adva_users{"application": username => "application",}
    ext-con::adva_users{"adva": username => "adva",}
    #include gems_ext_con
    #include ree
    #include nginx
}

node /ext-con-sk-\d\d/ {
    #include base_configs
    ext-con::adva_users{"application": username => "application",}
    ext-con::adva_users{"adva": username => "adva",}
}

# host-europe server (for advabest)
node 'ds87-230-55-112' inherits default {
    include packages::ree
    include advabest::packages
    #include advabest::gems
    include advabest::nginx
}
