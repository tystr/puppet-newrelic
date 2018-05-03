class newrelic::server::install ($ensure) {
    include newrelic::repo

    package {'newrelic-sysmond':
        ensure  => $::newrelic::server::install::ensure,
        require => Class['newrelic::repo']
    }
}
