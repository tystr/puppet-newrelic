class newrelic::service {
    service { 'newrelic-sysmond':
        ensure => running
    }
}
