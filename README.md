Newrelic Puppet Module
======================
[![Build Status](https://travis-ci.org/tystr/puppet-newrelic.png?branch=master)](https://travis-ci.org/tystr/puppet-newrelic)

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

Currently the following application monitoring agents are supported:

- [PHP] (#php)

#### PHP
Basic installation:
```puppet
class { 'newrelic::php':
    license_key => 'your_license_key',
}
```

If you need to customize the installation process, you can pass parameters to the class:
```puppet
class { 'newrelic::php':
    license_key => 'your_license_key',
    install_noksh => 1,
    install_shell => 'bash',
    install_path => 'path1:path2',
    install_phplist => 'dir1:dir2',
    install_arch => 'x86',
    install_initscript => 'initscript-name',
    install_daemonpath => '/usr/bin/newrelic-daemon',
    install_use_cp_not_ln => 'startup-daemon'
}
```
See [Newrelic's documentation](https://docs.newrelic.com/docs/php/running-the-install-script-in-silent-mode#install-environment) for more information about these options.

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
