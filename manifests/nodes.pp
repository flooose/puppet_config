# /etc/puppet/manifests/nodes.pp

# TODO: refactor default so that it's more minimal. This also means
# refactoring base_backages and base_configs, but default should only
# include:
# 1. puppet_client
# 2. base_configs
# 3. base_packages
node default {
    include puppet_client
    include base_packages 
    include base_configs
    adva_users{"adva": username => "adva",}
}

# The puppetmasterd node should inherit default and then have
# directives specific to being a master.
node 'servercharlie.bestgroup' {
    include puppet_client
}

# Blueprint for potential future nodes.
node 'ext-b2c-sk-test' inherits default {
    include gems
    include ree
    include nginx
    adva_users{"application": username => "application",}
}

# Test node for sktest
node 'ext-con-sk-test.siewert-und-kau' {

}
