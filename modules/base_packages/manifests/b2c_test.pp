class base_packages::b2c_test {
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

