class newrelic::server::service {

    if $newrelic::service_present != 'absent' {
        service { 'newrelic-sysmond':
            ensure => running
        }
    }
}
