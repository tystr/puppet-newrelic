class newrelic::php::install ($license_key) {
    require newrelic::repo
    
    Package['newrelic-php5'] -> Exec['newrelic-install']
    package { 'newrelic-php5':
        ensure => latest
    }
    exec { 'newrelic-install':
        environment => ['NR_INSTALL_SILENT=1', "NR_INSTALL_KEY=${license_key}"],
        command => "newrelic-install install",
        path => ['/bin', '/usr/bin'],
        require => Package['newrelic-php5'],
        notify => Service['php-fpm'],
        creates => '/etc/php.d/newrelic.ini'
    }
}
