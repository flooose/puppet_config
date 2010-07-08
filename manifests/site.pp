# /etc/puppet/manifests/site.pp

import "modules"
import "nodes"

## Set global defaults - including backing up all files to the main filebucket and adds a global path
#File { backup => main }
#Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }
