class newrelic::configure ($license_key) {
    exec { 'nrsysmond-config-license':
        command => "nrsysmond-config --set license_key=${license_key}",
        path => ['/bin', '/usr/bin'],
        notify => Service['newrelic-sysmond']
    }
}
