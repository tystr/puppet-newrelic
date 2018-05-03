class newrelic::server::install (
    $license_key,
    $ensure,
    ) {
    include newrelic::repo

    package {'newrelic-sysmond':
        ensure  => $::newrelic::server::install::ensure,
        require => Class['newrelic::repo']
    }

    if $::newrelic::server::install::ensure != 'absent' {
        exec { 'nrsysmond-config-license':
            command     => "nrsysmond-config --set license_key=${license_key}",
            path        => ['/bin', '/usr/bin', '/usr/sbin'],
            notify      => Service['newrelic-sysmond'],
            refreshonly => true,
            subscripe   => Package['newrelic-sysmod']
        }
        Package['newrelic-sysmond'] -> Exec['nrsysmond-config-license']
    }
