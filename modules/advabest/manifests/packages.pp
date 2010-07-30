class advabest::packages {
    package {
        "zlib1g-dev":
            ensure => installed;
        "libssl-dev":
            ensure => installed;
        "libreadline5-dev":
            ensure => installed;
        "libmysqlclient15-dev":
            ensure => installed;
        "mysql-server":
            ensure => installed;
        "libmagick9-dev":
            ensure => installed;
        "libxslt-dev":
            ensure => installed;
    }
}
