class newrelic::server::service ($ensure) {

    if $::newrelic::server::service::ensure != 'absent' {
        service { 'newrelic-sysmond':
            ensure => running
        }
    }
}
