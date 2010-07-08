class servercharlie {
    package {
        "postgresql":
            ensure => installed;
        "postgresql-server-dev-8.3":
            ensure => installed;
    }
}
