class newrelic::php ($license_key) {
    require newrelic::repo

    package { 'newrelic-php5':
        ensure => latest,
        notify => Exec['newrelic-install']
    }
    exec { 'newrelic-install':
        environment => ['NR_INSTALL_SILENT=1', "NR_INSTALL_KEY=${license_key}"],
        command => "newrelic-install install",
        path => ['/bin', '/usr/bin'],
        require => Package['newrelic-php5'],
        refreshonly => true,
        notify => Service['php-fpm']
    }
}
