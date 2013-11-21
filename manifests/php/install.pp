class newrelic::php::install ($license_key) {
    require newrelic::repo
    
    package { 'newrelic-php5':
        ensure => installed
    }

    exec { 'newrelic-install':
        environment => ['NR_INSTALL_SILENT=1', "NR_INSTALL_KEY=${license_key}"],
        command => "newrelic-install install",
        path => ['/bin', '/usr/bin'],
        require => Package['newrelic-php5'],
        notify => Service['php-fpm'],
        unless => 'test -f /etc/init.d/newrelic-daemon'
    }
}
