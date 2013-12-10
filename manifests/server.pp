class newrelic::server ($license_key) {
    class{ 'newrelic::server::install':
        license_key => $license_key
    } ->
    class { 'newrelic::server::service': } ->
    Class['newrelic::server']
}
