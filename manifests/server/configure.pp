class newrelic::server::configure ($license_key) {
    if $newrelic::service_present != 'absent'{
        exec { 'nrsysmond-config-license':
            command => "nrsysmond-config --set license_key=${license_key}",
            path => ['/bin', '/usr/bin', '/usr/sbin'],
            notify => Service['newrelic-sysmond'],
            refreshonly => true
        }
    }
}
