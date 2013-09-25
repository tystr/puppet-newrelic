class newrelic {
    class { 'newrelic::install': } ->
    class { 'newrelic::configure': } ->
    class { 'newrelic::service': } ->
    Class['newrelic']
}
