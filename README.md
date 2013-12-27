Newrelic Puppet Module
======================
This module manages installation and configuration of newrelic server monitoring daemon and application monitoring
agents.

Quick Start
-----------

### Install the server monitoring daemon
```puppet
class { 'newrelic::server':
    license_key => 'your_license_key'
}
```

### Install application monitoring agents

Note: Currently only the php agent is supported

```puppet
class { 'newrelic::php':
    license_key => 'your_license_key',
}
```

License
-------
This module is released under the [MIT](http://opensource.org/licenses/MIT) License.

Contact
-------
Tyler Stroud <tyler@tylerstroud.com>


Support
-------

Please log tickets and issues at our [Projects site](https://github.com/tystr/puppet-newrelic/issues)

Running the Tests
-----------------
To run the rspec-puppet tests:

`rake spec`
