class newrelic::server::service {

    if $::newrelic::nrsrvmon_installed != 'absent' {
        service { 'newrelic-sysmond':
            ensure => running
        }
    }
}
