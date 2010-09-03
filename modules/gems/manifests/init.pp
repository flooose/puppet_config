# /etc/puppet/modules/gems/manifests/init.pp

# TODO: This should be deprecated, at least for
# servers running rails3. Gems are for the most
# part managed by our applications and shouldn't
# be managed by puppet.
class gems_sk_all {
    package { 
        "god":
            provider => gem,
            ensure => installed;
        "rake":
            provider => gem,
            ensure => installed;
    }
}

class gems_b2c_base {
    package {
        "pg":
            provider => gem,
            ensure => installed;
        "rack":
            provider => gem,
            ensure => installed;
        "rails":
            provider => gem,
            ensure => "3.0.0.beta4";
    }
}

class gems_ext_con {
    package {
        "rails":
            provider => gem,
            ensure   => "2.3.4";
        "addressable":
            provider => gem;
        "after_commit":
            provider => gem;
        "astrails-safe":
            provider => gem;
        "aws-s3":
            provider => gem;
        "blankslate":
            provider => gem;
        "bluepill":
            provider => gem;
        "builder":
            provider => gem;
        "capistrano":
            provider => gem;
        "capistrano-ext":
            provider => gem;
        "choice":
            provider => gem;
        "daemons":
            provider => gem;
        "dbd-odbc":
            provider => gem;
        "dbi":
            provider => gem;
        "delayed_job":
            provider => gem;
        "deprecated":
            provider => gem;
        "diff-lcs":
            provider => gem;
        "fastercsv":
            provider => gem;
        "fastthread":
            provider => gem;
        "god":
            provider => gem;
        "highline":
            provider => gem;
        "hpricot":
            provider => gem;
        "madeleine":
            provider => gem;
        "mime-types":
            provider => gem;
        "mocha":
            provider => gem;
        "mysql":
            provider => gem;
        "net-scp":
            provider => gem;
        "net-sftp":
            provider => gem;
        "net-ssh":
            provider => gem;
        "net-ssh-gateway":
            provider => gem;
        "newrelic_rpm":
            provider => gem;
        "nokogiri":
            provider => gem;
        "open4":
            provider => gem;
        "paperclip":
            provider => gem;
        "passenger":
            provider => gem;
        "polyglot":
            provider => gem;
        "prawn":
            provider => gem;
        "prawn-core":
            provider => gem;
        "prawn-format":
            provider => gem;
        "prawn-layout":
            provider => gem;
        "rack":
            provider => gem;
        "rake":
            provider => gem;
        "redgreen":
            provider => gem;
        "redis":
            provider => gem;
        "redis-store":
            provider => gem;
        "request-log-analyzer":
            provider => gem;
        "riddle":
            provider => gem;
        "rip":
            provider => gem;
        "rmagick":
            provider => gem;
        "rspec":
            provider => gem;
        "rspec-rails":
            provider => gem;
        "ruby-odbc":
            provider => gem;
        "ruby2ruby":
            provider => gem;
        "ruby_parser":
            provider => gem;
        "runt":
            provider => gem;
        "sexp_processor":
            provider => gem;
        "sinatra":
            provider => gem;
        "spork":
            provider => gem;
        "sqlite3-ruby":
            provider => gem;
        "state_machine":
            provider => gem;
        "term-ansicolor":
            provider => gem;
        "thinking-sphinx":
            provider => gem;
        "tinder":
            provider => gem;
        "treetop":
            provider => gem;
        "webrat":
            provider => gem;
        "will_paginate":
            provider => gem;
        "xml-simple":
            provider => gem;
    }
}
