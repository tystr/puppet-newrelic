class newrelic::php::install ($license_key = '6026ea41b096c689e677fecae4f276bebcff01c0') {
    require newrelic::repo
    
    package { 'newrelic-php5':
        ensure => installed
    }

    exec { 'newrelic-install':
        environment => ['NR_INSTALL_SILENT=1', "NR_INSTALL_KEY=${license_key}"],
        command => "newrelic-install install",
        path => ['/bin', '/usr/bin'],
        require => Package['newrelic-php5'],
        notify => Service['php-fpm']
    }
}
