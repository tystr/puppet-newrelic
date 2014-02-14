require 'spec_helper'

describe 'newrelic::php', :type => :class do
    let(:params) { {:license_key => '7ac66c0f148de9519b8bd264312c4d64'} }
    let(:facts) { {:operatingsystem => 'Linux'} }

    it { should contain_class('newrelic::repo') }
    it { should contain_package('newrelic-php5').with(
        :ensure => 'latest',
        :notify => 'Exec[newrelic-install]'
    )}

    context "with parameter defaults" do
      it { should compile }
      it { should contain_exec('newrelic-install').with(
          :environment => ['NR_INSTALL_SILENT=1','NR_INSTALL_KEY=7ac66c0f148de9519b8bd264312c4d64'],
          :command => 'newrelic-install install',
          :path => ['/bin', '/usr/bin'],
          :require => 'Package[newrelic-php5]',
          :refreshonly => true
      )}
    end

    context "with parameter overrides" do
      it { should compile }
      let(:params) { {
        :license_key => '7ac66c0f148de9519b8bd264312c4d64',
        :install_noksh => 'noksh',
        :install_shell => 'shell',
        :install_path => 'path',
        :install_phplist => 'phplist',
        :install_arch => 'arch',
        :install_initscript => 'initscript',
        :install_daemonpath => 'daemonpath',
        :install_use_cp_not_ln => 'use_cp_not_ln'
      } }
      it { should contain_exec('newrelic-install').with(
          :environment => [
              'NR_INSTALL_SILENT=1',
              'NR_INSTALL_KEY=7ac66c0f148de9519b8bd264312c4d64',
              'NR_INSTALL_NOKSH=noksh',
              'NR_INSTALL_SHELL=shell',
              'NR_INSTALL_PATH=path',
              'NR_INSTALL_PHPLIST=phplist',
              'NR_INSTALL_ARCH=arch',
              'NR_INSTALL_INITSCRIPT=initscript',
              'NR_INSTALL_DAEMONPATH=daemonpath',
              'NR_INSTALL_USE_CP_NOT_LN=use_cp_not_ln'
          ],
          :command => 'newrelic-install install',
          :path => ['/bin', '/usr/bin'],
          :require => 'Package[newrelic-php5]',
          :refreshonly => true
      )}
    end

    context "with ensure => absent" do
      let(:params) { {
        :license_key => '7ac66c0f148de9519b8bd264312c4d64',
        :ensure => 'absent'
      } }

      it { should contain_package('newrelic-php5').with(
        :ensure => 'absent'
      ) }
      it { should contain_exec('newrelic-install').with(
        :command => 'newrelic-install purge'
      ) }
    end
end
