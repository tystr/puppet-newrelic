class newrelic::server (
    $license_key,
    $ensure = 'present'
    ) {
    class{ 'newrelic::server::install':
        license_key => $license_key,
        ensure      => $ensure
    } ->
    class { 'newrelic::server::service': } ->
    Class['newrelic::server']
}
