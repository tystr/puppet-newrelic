class newrelic::install {
    include newrelic::repo

    package {'newrelic-sysmond':
        ensure => present,
        require => Class['newrelic::repo']
    }
}
