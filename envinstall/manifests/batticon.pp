# == Class: batticon
#
# This class installs and configure slim and slimlock.
#
# === Variables
#
# [*pkgs*]
#   Array of packages to be installed
#
# === Examples
#
#  class { 'batticon': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmb@gmail.com>
#
# === Copyright
#
# Copyright 2015 Stanislaw Bogatkin.
#
class envinstall::batticon ( $user = $envinstall::params::user ) inherits envinstall::params {

  if ! defined(Vcsrepo['/tmp/common-files']) {
    vcsrepo { '/tmp/common-files':
      ensure => present,
      provider => git,
      source => 'https://github.com/sorrowless/common-files.git',
    }
  }

  file { '/home/$user/.config/autostart/batticon.desktop':
    ensure => present,
    owner => $user,
    source => '/tmp/common-files/home/sbog/.config/autostart/batticon.desktop',
    require => Vcsrepo['/tmp/common-files'],
  }

  vcsrepo { '/tmp/battery-systray':
    ensure => present,
    provider => git,
     source => 'https://github.com/sorrowless/battery-systray.git',
  }

  file { '/home/$user/.config/battery-systray':
    ensure => directory,
    owner => $user,
    require => Vcsrepo['/tmp/common-files'],
  }

  file { '/home/$user/.config/battery-systray/themes':
    ensure => directory,
    owner => $user,
    source => '/tmp/battery-systray/themes',
    require => File['/home/$user/.config/battery-systray'],
  }

  file { '/home/$user/.config/battery-systray/settings.json':
    ensure => directory,
    owner => $user,
    source => '/tmp/battery-systray/settings.json',
    require => File['/home/$user/.config/battery-systray'],
  }

  file { '/usr/bin/batticon.py':
    ensure => directory,
    source => '/tmp/battery-systray/batticon.py',
    require => Vcsrepo['/tmp/common-files'],
  }

}
