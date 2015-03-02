# == Class: common
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
#  class { 'common': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmb@gmail.com>
#
# === Copyright
#
# Copyright 2015 Stanislaw Bogatkin.
#
class envinstall::common ( $user = $envinstall::params::user ) inherits envinstall::params {

  $common_pkgs = [ 'menutray', 'zsh', 'gimp' ]

  package { $common_pkgs:
    ensure => installed
  }

  if ! defined(Vcsrepo['/tmp/common-files']) {
    vcsrepo { '/tmp/common-files':
      ensure => present,
      provider => git,
      source => 'https://github.com/sorrowless/common-files.git',
    }
  }

  file { '/home/$user/.config/autostart/menutray.desktop':
    ensure => present,
    owner => $user,
    source => '/tmp/common-files/home/sbog/.config/autostart/menutray.desktop',
    require => Vcsrepo['/tmp/common-files'],
  }

  file { '/home/$user/.config/autostart/setxkbmap.desktop':
    ensure => present,
    owner => $user,
    source => '/tmp/common-files/home/sbog/.config/autostart/setxkbmap.desktop',
    require => Vcsrepo['/tmp/common-files'],
  }

  file { '/home/$user/.config/autostart/xfce4-power-manager.desktop':
    ensure => present,
    owner => $user,
    source => '/tmp/common-files/home/sbog/.config/autostart/xfce4-power-manager.desktop',
    require => Vcsrepo['/tmp/common-files'],
  }

  file { '/home/$user/.zshrc':
    ensure => present,
    owner => $user,
    source => '/tmp/common-files/home/sbog/.zshrc',
    require => Vcsrepo['/tmp/common-files'],
  }

  file { '/home/$user/.vimrc':
    ensure => present,
    owner => $user,
    source => '/tmp/common-files/home/sbog/.vimrc',
    require => Vcsrepo['/tmp/common-files'],
  }

  file { '/usr/share/gimp/2.0/images/gimp-splash.png':
    ensure => present,
    source => '/tmp/common-files/usr/share/gimp/2.0/images/gimp-splash.png',
    require => Vcsrepo['/tmp/common-files'],
  }

}
