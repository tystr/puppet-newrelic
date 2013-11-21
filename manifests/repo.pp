class newrelic::repo {
    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic':
        source => 'puppet:///modules/newrelic/etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic',
        owner => 'root',
        group => 'root',
        mode => '644',
    }
    yumrepo { 'newrelic':
        baseurl => 'http://yum.newrelic.com/pub/newrelic/el5/$basearch',
        descr => 'New Relic packages for Enterprise Linux 5 - $basearch',
        enabled => 1,
        gpgcheck => 1,
        gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic',
        require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic']
   }
}
