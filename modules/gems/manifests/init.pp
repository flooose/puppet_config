class {
    package { "god":
        provider => gem,
        ensure => installed;
    package { "rake":
        provider => gem,
        ensure => installed,
    }
}
