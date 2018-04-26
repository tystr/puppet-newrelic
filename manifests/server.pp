class newrelic::server (
    $license_key,
    $service_present = 'present'
    ) {
    class{ 'newrelic::server::install':
        license_key => $license_key
        service_present => $service_present
    } ->
    class { 'newrelic::server::service': } ->
    Class['newrelic::server']
}
