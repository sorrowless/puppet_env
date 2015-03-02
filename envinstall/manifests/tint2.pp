# == Class: tint2
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
#  class { 'tint2': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmn@gmail.com>
#
# === Copyright
#
# Copyright 2015 Stanislaw Bogatkin.
#
class envinstall::tint2 ( $user = $envinstall::params::user ) inherits envinstall::params {

  $tint2_pkgs = [ 'tint2' ]

  package { $tint2_pkgs:
    ensure => installed
  }

  if ! defined(Vcsrepo['/tmp/common-files']) {
    vcsrepo { '/tmp/common-files':
      ensure => present,
      provider => git,
      source => 'https://github.com/sorrowless/common-files.git',
    }
  }

  file { '/home/$user/.config/autostart/tint\ panel.desktop':
    ensure => present,
    owner => $user,
    source => '/tmp/common-files/home/sbog/.config/autostart/tint\ panel.desktop',
    require => Vcsrepo['/tmp/common-files'],
  }

  file { '/home/$user/.config/tint2':
    ensure => directory,
    owner => $user,
    source => '/tmp/common-files/home/sbog/.config/tint2',
    require => Vcsrepo['/tmp/common-files'],
  }
}
