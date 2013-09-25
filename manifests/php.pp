class newrelic::php ($license_key) {
    class { 'newrelic::php::install': 
        license_key => $license_key
    } ->
    Class ['newrelic::php']
}
