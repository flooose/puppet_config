class advabest::nginx {
    # A hack to fix that fact that we can't figure out how
    # to force control where puppet keeps it's pid file in
    # ubuntu citizens
    file {
        "/var/lib/puppet/run/puppetd.pid":
            ensure  => "/var/puppet/run/puppetd.pid",
    }
}
