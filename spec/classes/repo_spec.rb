require 'spec_helper'

describe 'newrelic::repo' do
    it { should compile.with_all_deps }
    it { should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic').with(
        :owner => 'root',
        :group => 'root',
        :mode => '644'
    )}
    it { should contain_yumrepo('newrelic').with_require('File[/etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic]').with(
        :baseurl => 'http://yum.newrelic.com/pub/newrelic/el5/$basearch',
        :enabled => 1,
        :gpgcheck => 1,
        :gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic'
    )}
end
