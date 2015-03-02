# == Class: slim
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
#  class { 'slim': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmn@gmail.com>
#
# === Copyright
#
# Copyright 2014 Stanislaw Bogatkin.
#
class envinstall::slim {

  $slim_pkgs = [ 'slim', 'slim-themes' ]
  $slim_current_theme = 'october'

  package { $slim_pkgs:
    ensure => installed
  } ->

  vcsrepo { '/tmp/slim_october_theme':
    ensure => present,
    provider => git,
    source => 'https://github.com/sorrowless/slim_october_theme.git',
  } ->

  file { "/usr/share/slim/themes/$slim_current_theme":
    ensure => directory,
    owner  => root,
    source => '/tmp/slim_october_theme/october/',
  } ->

  exec { 'change_theme':
    command => 'sed -i "/^#/! s:current_theme.*:current_theme october:g" /etc/slim.conf',
    path => '/bin/:/usr/bin/',
  } ->

  exec { 'slimlock':
    command => "xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>l' -n -t string -s slimlock",
    path => '/bin/:/usr/bin/',
    unless => "xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>l' | grep slimlock",
  }

}
