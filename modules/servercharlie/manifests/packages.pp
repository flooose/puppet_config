class servercharlie::packages {
    package {
        "libxml2-utils":
            ensure => installed;
        "postgresql":
            ensure => installed;
        "postgresql-server-dev-8.3":
            ensure => installed;
        "libsqlite3-dev":
            ensure => installed;
        "sqlite3":
            ensure => installed;
    }
}
