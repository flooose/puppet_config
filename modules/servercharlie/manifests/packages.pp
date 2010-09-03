class servercharlie::packages {
    package {
        "libxml2-utils":
            ensure => installed;
        "postgresql":
            ensure => installed;
        "libsqlite3-dev":
            ensure => installed;
        "sqlite3":
            ensure => installed;
        "apache2":
            ensure => installed;
    }
}
