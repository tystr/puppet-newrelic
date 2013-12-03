class newrelic::server ($license_key) {
    class { 'newrelic::server::install': } ->
    class { 'newrelic::server::configure': 
        license_key => $license_key
    } ~>
    class { 'newrelic::server::service': } ->
    Class['newrelic::server']
}
