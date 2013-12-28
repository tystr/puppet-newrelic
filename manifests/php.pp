class newrelic::php (
    $license_key,
    $php_service = $newrelic::php::params::php_service
) inherits newrelic::php::params {
    include newrelic::repo

    package { 'newrelic-php5':
        ensure => latest,
        require => Class['newrelic::repo'],
        notify => Exec['newrelic-install']
    }
    exec { 'newrelic-install':
        environment => ['NR_INSTALL_SILENT=1', "NR_INSTALL_KEY=${license_key}"],
        command => "newrelic-install install",
        path => ['/bin', '/usr/bin'],
        require => Package['newrelic-php5'],
        refreshonly => true
    }

    if ($php_service != undef) {
        Exec['newrelic-install'] ~> Service[$php_service]
    }
}
