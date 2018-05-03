class newrelic::server (
    $license_key,
    $ensure = 'present'
    ) {
    class{ 'newrelic::server::install':
        license_key => $license_key,
        ensure      => $ensure
    } ->
    class { 'newrelic::server::configure':
        license_key => $license_key,
        ensure      => $ensure

    } ->
    class { 'newrelic::server::service':
        ensure      => $ensure
    } ->
    Class['newrelic::server']
}
