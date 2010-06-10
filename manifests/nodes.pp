# /etc/puppet/manifests/nodes.pp

# What all nodes include. Here we should have:
# 1. /etc/bash.bashrc
# 2. /etc/inputrc
# 3. /home/#{user}/.bashrc
# 4. /home/#{user}/.ssh/*
# 5. ....
node basenode {
    include bashrc
    include sudo
}

# Blueprint for potential future nodes.
node b2c.test inherits from basenode {

}
