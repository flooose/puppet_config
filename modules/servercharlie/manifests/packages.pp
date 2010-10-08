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
        "libxmlsec1":
            ensure => installed;
        "libxmlsec1-openssl":
            ensure => installed;
        "xmlsec1":
            ensure => installed;
    }
}
