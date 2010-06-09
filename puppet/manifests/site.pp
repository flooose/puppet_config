import "classes/*"

# Default for all nodes
node default {
  include sudo
}

# /home/adva/somefile.puppet
file { "/home/adva/somefile.puppet":
        owner => adva, group => adva, mode => 644
}
