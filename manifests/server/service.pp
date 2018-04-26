class newrelic::server::service {

    if $::newrelic::ensure != 'absent' {
        service { 'newrelic-sysmond':
            ensure => running
        }
    }
}
