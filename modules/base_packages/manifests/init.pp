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
#      -- see build howto
#      -- .deb package location: ${Production_Server}/home/chris/debs
#      -- after install "ln -s /usr/bin/gem1.8 /usr/bin/gem
#      -- install all gems "ruby gem_install.rb gem_list" see files.
#
############################################################################

# Use something like this to differentiate between systems.
# Perhaps this can be done with specific nodes too.
$proftp = $operatingsystem ? {
        solaris => SMCossl,
        default => proftp
}

class proftp {
    # 4. proftp - deny access for all users except 'siewertkau'
    #   -- /etc/proftpd/proftpd.conf
    package { $proftp:
              ensure => installed }

    #file { "/etc/sudoers":
    #  owner => "root",
    #  group => "root",
    #  mode  => 440,
    #  source  => "puppet:///sudo/sudoers",
    #  require => Package["sudo"],
    #}
}

class mysql {
    # 5. mysql
    #    -- 5.1 from backports
    #      -- root password - same as system
    package { mysql: /*FROM BACKPORTS!!!*/ }

    # SETUP MYCNF MODULE
    #file { "/etc/sudoers":
    #  owner => "root",
    #  group => "root",
    #  mode  => 440,
    #  source  => "puppet:///sudo/sudoers",
    #  require => Package["sudo"],
    #}
}

class ruby_ee {
    # 6. rubyenterprise
    # RESEARCH CUSTOM PACKAGES
}

class sphinx {
    # 7. sphinx search - custom build
    #   -- see build howto
    #   -- .deb package location: ${Production_Server}/home/chris/debs
    #   -- /etc/init.d/sphinx -- makes hard coded references to the application, be sure to sanity check -- see file
    #   -- /etc/defaults/sphinx -- makes hard coded references to the application,
    #      be sure to sanity check -- see file
    #   -- "update-rc.d sphinx defaults"
    #   -- "ln -s #{application_root}/config/#{main_sphinx.conf}" /home/application/.sphinxrc
}

class nginx {
    # 8. nginx - custom build
    #   -- see build howto
    #   -- .deb package location: ${Production_Server}/home/chris/debs
}

#    9. god - installed with gems
#      -- /etc/init.d/god -- makes hard coded references to the application, be sure to sanity check -- see file
#      -- /etc/defaults/god -- makes hard coded references to the application, be sure to sanity check -- see file
#      -- "update-rc.d god defaults"
#      -- "ln -s #{appication_root}/#{main_god.god}" /home/application/.godrc

class libxml2 {
#    10.libxml2, libxml2-dev, libxslt1.1, libxslt-dev
    package { libxml2:
              ensure => installed,
    }

    package { libxml2-dev:
              ensure => installed,
    }

    package { libxslt1.1:
              ensure => installed,
    }

    package { libxslt-dev:
              ensure => installed,
    }
}

class sqlite3 {
#    11.sqlite3
    package { sqlite3:
              ensure => installed,
    }
}

class libmagick10 {
#    12.libmagick10, libmagick9-dev
    package { libmagick10:
              ensure => installed,
    }
    package { libmagick9-dev:
              ensure => installed,
    }
}

class odbc {
#    14.freetds-dev tdsodbc sqsh unixodbc unixodbc-dev
#      -- /etc/freetds/freetds.conf
#      -- /home/application/.sqshrc
#      -- /etc/odbc.ini
    package { freetds-dev:
              ensure => installed,
    }
    package { tdsodbc:
              ensure => installed,
    }
    package { sqsh:
              ensure => installed,
    }
    package { unixodbc:
              ensure => installed,
    }
    package { unixodbc-dev:
              ensure => installed,
    }
}

class libprce3_dev {
#    15.libpcre3-dev
    package { libprce3-dev:
              ensure => installed,
    }
}

#    16.New Relic
#      -- sudo gem install newrelic_rpm
class apache2_utils {
#    17.apache2-utils
    package { apache2-utils:
              ensure => installed,
    }
}

class libmysqlclient-dev {
#    18.libmysqlclient-dev
    package { libmysqlclient-dev:
              ensure => installed,
    }
}

class postfix {
#    19.postfix
}
