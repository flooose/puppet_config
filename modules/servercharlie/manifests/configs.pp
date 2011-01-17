class servercharlie::configs{
    file {
# apt sources updated to allow installation from backports
        "/etc/apt/sources.list":
            owner   => "root",
                    group   => "root",
                    mode    => 644,
                    source  => "puppet:///servercharlie/apt/sources.list";
        "/etc/apt/preferences":
            owner   => "root",
                    group   => "root",
                    mode    => 644,
                    source  => "puppet:///servercharlie/apt/preferences";
    }
}
