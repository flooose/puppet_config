class base_packages::base_all {
    package {
        "ruby":
            ensure => installed;
        "ruby-dev":
            ensure => installed;
        "screen":
            ensure => installed;
        "fakeroot":
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
        "openssh-server":
            ensure => installed;
        "vim-nox":
            ensure => installed;
        "vim":
            ensure => installed;
        "munin-node":
            ensure => installed;
    }
}
