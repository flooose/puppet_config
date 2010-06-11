class somefile {

  # Ensures that this package is always up to date
  #package { bash: ensure => latest }

  file { "/home/adva/somefile":
    ensure  => exists,
    owner   => "adva",
    group   => "adva",
    mode    => 440,
    source  => "puppet:///somefile/somefile",
  }
}
