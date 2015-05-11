class newrelic::php (
    $license_key,
    $ensure                = $newrelic::php::params::ensure,
    $php_service           = $newrelic::php::params::php_service,
    $install_noksh         = $newrelic::php::params::noksh,
    $install_shell         = $newrelic::php::params::install_shell,
    $install_path          = $newrelic::php::params::install_path,
    $install_phplist       = $newrelic::php::params::install_php_list,
    $install_arch          = $newrelic::php::params::install_arch,
    $install_initscript    = $newrelic::php::params::install_initscript,
    $install_daemonpath    = $newrelic::php::params::install_daemon_path,
    $install_use_cp_not_ln = $newrelic::php::params::install_use_cp_not_ln
) inherits newrelic::php::params {
    include newrelic::repo

    if ($ensure = 'absent') {
      Exec['newrelic-install'] -> Package['newrelic-php5']
    }
    else {
      Package['newrelic-php5'] -> Exec['newrelic-install']
    }

    package { 'newrelic-php5':
        ensure  => $ensure,
        require => Class['newrelic::repo'],
    }

    $nr_install_noksh = $install_noksh ? {
      undef   => nil,
      default => "NR_INSTALL_NOKSH=${install_noksh}"
    }
    $nr_install_shell = $install_shell ? {
      undef   => nil,
      default => "NR_INSTALL_SHELL=${install_shell}"
    }
    $nr_install_path = $install_path ? {
      undef   => nil,
      default => "NR_INSTALL_PATH=${install_path}"
    }
    $nr_install_phplist = $install_phplist ? {
      undef   => nil,
      default => "NR_INSTALL_PHPLIST=${install_phplist}"
    }
    $nr_install_arch = $install_arch ? {
      undef   => nil,
      default => "NR_INSTALL_ARCH=${install_arch}"
    }
    $nr_install_initscript = $install_initscript ? {
      undef   => nil,
      default => "NR_INSTALL_INITSCRIPT=${install_initscript}"
    }
    $nr_install_daemonpath = $install_daemonpath ? {
      undef   => nil,
      default => "NR_INSTALL_DAEMONPATH=${install_daemonpath}"
    }
    $nr_install_use_cp_not_ln = $install_use_cp_not_ln ? {
      undef   => nil,
      default => "NR_INSTALL_USE_CP_NOT_LN=${install_use_cp_not_ln}"
    }

    $env_temp = [
      'NR_INSTALL_SILENT=1',
      "NR_INSTALL_KEY=${license_key}",
      $nr_install_noksh,
      $nr_install_shell,
      $nr_install_path,
      $nr_install_phplist,
      $nr_install_arch,
      $nr_install_initscript,
      $nr_install_daemonpath,
      $nr_install_use_cp_not_ln
    ]
    $env = delete($env_temp, nil)

    $install_option = $ensure ? { absent => 'purge', default => 'install' }
    exec { 'newrelic-install':
        environment => $env,
        command     => "newrelic-install ${install_option}",
        path        => ['/bin', '/usr/bin'],
        refreshonly => true
    }

    if ($php_service != undef) {
        Exec['newrelic-install'] ~> Service[$php_service]
    }
}
