require 'spec_helper'

describe 'newrelic::server' do
    let(:params) { { :license_key => '7ac66c0f148de9519b8bd264312c4d64'} }

    it { should compile.with_all_deps }
    it { should contain_class('newrelic::server::install').that_comes_before('Class[newrelic::server::service]') }
    it { should contain_class('newrelic::server::service').that_comes_before('Class[newrelic::server]') }
    it { should contain_class('newrelic::server') }
end
