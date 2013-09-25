class newrelic::server {
    class { 'newrelic::server::install': } ->
    class { 'newrelic::server::configure': } ->
    class { 'newrelic::server::service': } ->
    Class['newrelic::server']
}
