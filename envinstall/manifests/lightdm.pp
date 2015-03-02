# == Class: lightdm
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
#  class { 'lightdm': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmn@gmail.com>
#
# === Copyright
#
# Copyright 2015 Stanislaw Bogatkin.
#
class envinstall::lightdm ( $user = $envinstall::params::user ) inherits envinstall::params {

  $lightdm_pkgs = [ 'lightdm', 'lightdm-webkit-greeter', 'light-locker' ]
  $lightdm_current_theme = 'mac'

  package { $lightdm_pkgs:
    ensure => installed
  } ->

  vcsrepo { '/tmp/lightdm_mac_theme':
    ensure => present,
    provider => git,
    source => 'https://github.com/sorrowless/LightDM-Webkit-MacOSX-Theme.git',
  } ->

  file { "/usr/share/lightdm/themes/$lightdm_current_theme":
    ensure => directory,
    owner  => root,
    source => '/tmp/lightdm_mac_theme',
  } ->

  exec { 'change_theme':
    command => 'sed -i "/^#/! s:webkit-theme=.*:webkit-theme=mac:g" /etc/lightdm/lightdm-webkit-greeter.conf',
    path => '/bin/:/usr/bin/',
  } ->

  exec { 'light-lock':
    command => "xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>l' -n -t string -s 'light-locker-command -l'",
    path => '/bin/:/usr/bin/',
    unless => "xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>l' | grep light-locker-command",
  }

  if ! defined(Vcsrepo['/tmp/common-files']) {
    vcsrepo { '/tmp/common-files':
      ensure => present,
      provider => git,
      source => 'https://github.com/sorrowless/common-files.git',
    }
  }

  file { '/home/$user/.config/autostart/light-locker.desktop':
    ensure => present,
    owner => $user,
    source => '/tmp/common-files/home/sbog/.config/autostart/light-locker.desktop',
    require => Vcsrepo['/tmp/common-files'],
  }
}
