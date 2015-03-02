# == Class: video
#
# This class installs and configure video-related things.
#
# === Variables
#
# [*pkgs*]
#   Array of packages to be installed
#
# === Examples
#
#  class { 'video': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmb@gmail.com>
#
# === Copyright
#
# Copyright 2015 Stanislaw Bogatkin.
#
class envinstall::multimedia::audio ( $user = $envinstall::params::user ) inherits envinstall::params {

  $codecs_pkgs = [ 'gstreamer0.10-good-plugins' ]
  $viewers_pkgs = [ 'smplayer' ]

  package { $codecs_pkgs:
    ensure => installed
  }

  package { $viewers_pkgs:
    ensure => installed
  }

  vcsrepo { '/tmp/smplayer_themes':
    ensure => present,
    provider => git,
    source => 'https://github.com/sorrowless/smplayer_themes.git',
  }

  file { '/usr/share/smplayer/themes/kfaenza-mono':
    ensure => directory,
    require => Vcsrepo['/tmp/smplayer_themes'],
  }

  file { '/usr/share/smplayer/themes/kfaenza-mono/kfaenza-mono.rcc':
    ensure => present,
    source => '/tmp/smplayer_themes/kfaenza-mono/kfaenza-mono.rcc',
    require => File['/usr/share/smplayer/themes/kfaenza-mono'],
  }
}
