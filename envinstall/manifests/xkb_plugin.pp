# == Class: xkb_plugin
#
# This class installs and configure xkb-plugin for xfce4
#
# === Variables
#
# [*pkgs*]
#   Array of packages to be installed
#
# === Examples
#
#  class { 'xkb_plugin': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmn@gmail.com>
#
# === Copyright
#
# Copyright 2014 Stanislaw Bogatkin.
#
class envinstall::xkb_plugin {

  $xkb_pkgs = [ 'xfce4-xkb-plugin' ]

  package { $xkb_pkgs:
    ensure => installed
  } ->

  vcsrepo { '/tmp/xkb_custom_flags':
    ensure => present,
    provider => git,
    source => 'https://github.com/sorrowless/xkb_custom_flags.git',
  } ->

  file { "/usr/share/xfce4/xkb/flags/us.svg":
    ensure => present,
    source => '/tmp/xkb_custom_flags/us.svg',
  } ->

  file { "/usr/share/xfce4/xkb/flags/ru.svg":
    ensure => present,
    source => '/tmp/xkb_custom_flags/ru.svg',
  }
}
