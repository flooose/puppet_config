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

class base_all {
    package {
        "screen":
            ensure => installed;
        "fakeroot":
            ensure => installed;
        "ruby":
            ensure => installed;
        "git":
            ensure => installed;
        "git-core":
            ensure => installed;
        "sudo":
            ensure => installed;
        "rubygems":
            ensure => installed;
        "wget":
            ensure => installed;
        "build-essential":
            ensure => installed;
        "ruby1.8-dev":
            ensure => installed;
        "openssh-server":
            ensure => installed;
        "vim-nox":
            ensure => installed;
    }
}

class b2c_test{
    package{
        "libpq5":
            ensure => installed;
        "postgresql-client-common":
            ensure => installed;
        "postgresql-client-8.4":
            ensure => installed;
        "postgresql-common":
            ensure => installed;
        "postgresql-8.4":
            ensure => installed;
        "postgresql":
            ensure => installed;
        "postgresql-server-dev-8.4":
            ensure => installed;
        "libpq-dev":
            ensure => installed;
    }
}

class sk_base {
    # Use something like this to differentiate between systems.
    # Perhaps this can be done with specific nodes too.
    $proftp = $operatingsystem ? {
            solaris => SMCossl,
            default => "proftpd"
    }
    # 4. proftp - deny access for all users except 'siewertkau'
    #   -- /etc/proftpd/proftpd.conf
    package { "$proftp": ensure => installed, }

    # 10.libxml2, libxml2-dev, libxslt1.1, libxslt-dev
    package { "libxml2": ensure => installed, }
    package { "libxml2-dev": ensure => installed, }
    package { "libxslt1.1": ensure => installed, }
    package { "libxslt-dev": ensure => installed, }

    # 11.sqlite3
    package { "sqlite3": ensure => installed, }
    package { "libsqlite3-dev": ensure => installed, }

    # 12.libmagick10, libmagick9-dev
    package { "libmagick10": ensure => installed, }
    package { "libmagick9-dev": ensure => installed, }

    # 14.freetds-dev tdsodbc sqsh unixodbc unixodbc-dev
    # -- /etc/freetds/freetds.conf
    # -- /home/application/.sqshrc
    # -- /etc/odbc.ini
    package { "freetds-dev": ensure => installed, }
    package { "tdsodbc": ensure => installed, }
    package { "sqsh": ensure => installed, }
    package { "unixodbc": ensure => installed, }
    package { "unixodbc-dev": ensure => installed, }

    # 15.libpcre3-dev
    package { "libpcre3-dev": ensure => installed, }

    # 17.apache2-utils
    package { "apache2-utils": ensure => installed, }

    # REWORK - backports aren't working
    # 18.libmysqlclient-dev
    #package { "libmysqlclient16/lenny-backports": ensure => installed, }
    #package { "mysql-client/lenny-backports": ensure => installed, }
    #package { "libmysqlclient-dev/lenny-backports": ensure => installed, }
    #package { "mysql-common/lenny-backports": ensure => installed, }
    #package { "mysql-server/lenny-backports": ensure => installed, }
    #package { "mysql-client-5.1/lenny-backports": ensure => installed, }

    # munin-node
    package { "munin-node": ensure => installed, }

    # dev libraries for Ruby Enterprise
    package {
        "libssl-dev":
            ensure => installed;
        "libreadline-dev":
            ensure => installed;
    }
}

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
