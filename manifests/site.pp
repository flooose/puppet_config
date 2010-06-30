# /etc/puppet/manifests/site.pp

import "modules"
import "nodes"

## We probably don't want this yet, since we don't know what
## it does.
#
## The filebucket option allows for file backups to the server
#filebucket { main: server => 'my.server.name' }
#
## Set global defaults - including backing up all files to the main filebucket and adds a global path
#File { backup => main }
#Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }
