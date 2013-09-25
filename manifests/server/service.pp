class newrelic::server::service {
    service { 'newrelic-sysmond':
        ensure => running
    }
}
