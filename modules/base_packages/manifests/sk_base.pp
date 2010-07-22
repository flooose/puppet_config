class base_packages::sk_base {
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

    # dev libraries for Ruby Enterprise
    package {
        "libssl-dev":
            ensure => installed;
        "libreadline-dev":
            ensure => installed;
    }
}

