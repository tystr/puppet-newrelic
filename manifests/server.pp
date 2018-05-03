class newrelic::server (
    $license_key,
    $ensure = 'present'
    ) {
    class{ 'newrelic::server::install':
        ensure      => $ensure
    } ->
    class { 'newrelic::server::service':
        ensure      => $ensure
    } ->
    Class['newrelic::server']
}
