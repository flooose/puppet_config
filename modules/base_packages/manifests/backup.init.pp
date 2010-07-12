# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# ATM THIS FILE PERFORMS NO ACTIONS. ALL ACTIONS FOR THIS MODULE ARE
# IN SEPARATE FILES IN THIS DIRECTORY.
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
#
# /etc/puppet/modules/base_packages/manifests/init.pp
#
##################### DONE. PART OF BASIC DEBIAN INSTALL ###################
#  -- apt-get install
#    1. openssh-server
#      -- ssh-server - /etc/ssh/sshd_config - see file
#      -- add public keys from to user
#    13.git, git-core
#    2. wget
#    2. vim-nox
#      -- vimrc - /etc/vim/vimrc - see file
#    3. sudo
#      -- /etc/sudoers - see file
#    4. ruby
#    5. puppet
#    6. rubygems - custom build
#
############################################################################



/*    
    #
    #    16.New Relic
    #      -- sudo gem install newrelic_rpm

    # 7. sphinx search - custom build
    #   -- see build howto
    #   -- .deb package location: ${Production_Server}/home/chris/debs
    #   -- /etc/init.d/sphinx -- makes hard coded references to the application, be sure to sanity check -- see file
    #   -- /etc/defaults/sphinx -- makes hard coded references to the application,
    #      be sure to sanity check -- see file
    #   -- "update-rc.d sphinx defaults"
    #   -- "ln -s #{application_root}/config/#{main_sphinx.conf}" /home/application/.sphinxrc
    package { sphinxsearch: ensure => installed, }


class mysql {
    # 5. mysql
    #    -- 5.1 from backports
    #      -- root password - same as system
    package { mysql: FROM BACKPORTS!!! }

    # SETUP MYCNF MODULE
    #file { "/etc/sudoers":
    #  owner => "root",
    #  group => "root",
    #  mode  => 440,
    #  source  => "puppet:///sudo/sudoers",
    #  require => Package["sudo"],
    #}
}

#    9. god - installed with gems
#      -- /etc/init.d/god -- makes hard coded references to the application, be sure to sanity check -- see file
#      -- /etc/defaults/god -- makes hard coded references to the application, be sure to sanity check -- see file
#      -- "update-rc.d god defaults"
#      -- "ln -s #{appication_root}/#{main_god.god}" /home/application/.godrc

class postfix {
#    19.postfix
}
*/
