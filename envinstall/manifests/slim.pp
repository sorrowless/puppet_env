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
    #source => 'git@git.sbog.ru:/data/git/slim_october_theme.git',
    source => 'https://github.com/sorrowless/slim_october_theme.git',
    user => sbog, # we need that user and his ssh keys
  } ->

  file { "/usr/share/slim/themes/$slim_current_theme":
    ensure => directory,
    owner  => root,
    source => '/tmp/slim_october_theme/october/',
  } ->

  exec { 'change_theme':
    command => 'sed -i "/^#/! s:current_theme.*:current_theme october:g" /etc/slim.conf',
    path => '/bin/:/usr/bin/',
  }
}
