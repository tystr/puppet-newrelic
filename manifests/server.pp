class newrelic::server (
    $license_key,
    $nrsrvmon_installed = 'present'
    ) {
    class{ 'newrelic::server::install':
        license_key     => $license_key
        service_present => $nrsrvmon_installed
    } ->
    class { 'newrelic::server::service': } ->
    Class['newrelic::server']
}
