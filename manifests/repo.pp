class newrelic::repo {
    exec { 'newrelic-repo':
        command => 'rpm -Uvh --replacepkgs https://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm',
        path => ['/bin', '/usr/bin']
    }
}
