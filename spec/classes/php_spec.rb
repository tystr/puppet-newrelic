require 'spec_helper'

describe 'newrelic::php', :type => :class do
    it { should compile }

    let(:params) { {:license_key => '7ac66c0f148de9519b8bd264312c4d64'} }
    let(:facts) { {:operatingsystem => 'Linux'} }

    it { should contain_class('newrelic::repo') }
    it { should contain_package('newrelic-php5').with(
        :ensure => 'latest',
        :notify => 'Exec[newrelic-install]'
    )}

    it { should contain_exec('newrelic-install').with(
        :environment => ['NR_INSTALL_SILENT=1', 'NR_INSTALL_KEY=7ac66c0f148de9519b8bd264312c4d64'],
        :command => 'newrelic-install install',
        :path => ['/bin', '/usr/bin'],
        :require => 'Package[newrelic-php5]',
        :refreshonly => true
    )}
end
