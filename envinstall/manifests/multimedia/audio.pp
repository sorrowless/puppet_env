# == Class: audio
#
# This class installs and configure audio-related things.
#
# === Variables
#
# [*pkgs*]
#   Array of packages to be installed
#
# === Examples
#
#  class { 'audio': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmn@gmail.com>
#
# === Copyright
#
# Copyright 2015 Stanislaw Bogatkin.
#
class envinstall::multimedia::audio ( $user = $envinstall::params::user ) inherits envinstall::params {

  $pulse_pkgs = [ 'pulseaudio', 'pulseaudio-alsa', 'paprefs', 'pavucontrol', 'pasystray-git', 'xfce4-volumed', 'pnmixer', 'rygel' ]

  package { $pulse_pkgs:
    ensure => installed
  }

  if ! defined(Vcsrepo['/tmp/common-files']) {
    vcsrepo { '/tmp/common-files':
      ensure => present,
      provider => git,
      source => 'https://github.com/sorrowless/common-files.git',
    }
  }

  file { '/home/$user/.config/autostart/pasystray.desktop':
    ensure => present,
    owner => $user,
    source => '/tmp/common-files/home/sbog/.config/autostart/pasystray.desktop',
    require => Vcsrepo['/tmp/common-files'],
  }

  file { '/home/$user/.config/autostart/pmixer.desktop':
    ensure => present,
    owner => $user,
    source => '/tmp/common-files/home/sbog/.config/autostart/pmixer.desktop',
    require => Vcsrepo['/tmp/common-files'],
  }
}
