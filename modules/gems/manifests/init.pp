class {
    package { 
        "god":
            provider => gem,
            ensure => installed;
        "rake":
            provider => gem,
            ensure => installed;
    }
}
