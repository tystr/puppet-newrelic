class newrelic::server (
    $license_key,
    $ensure = 'present'
    ) {
    class{ 'newrelic::server::install':
        ensure      => $ensure,
        license_key => $license_key
    } ->
    class { 'newrelic::server::service':
        ensure      => $ensure
    } ->
    Class['newrelic::server']
}
