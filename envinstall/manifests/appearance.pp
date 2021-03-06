# == Class: appearance
#
# This class installs and configure themes and cursors.
#
# === Variables
#
# [*pkgs*]
#   Array of packages to be installed
#
# === Examples
#
#  class { 'appearance': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmn@gmail.com>
#
# === Copyright
#
# Copyright 2014-2015 Stanislaw Bogatkin.
#
class envinstall::appearance (
    $user = $envinstall::params::user,
    $xfce_current_theme = 'Numix-Frost-Light',
    $xfce_current_icons = 'Compass',
    $xfce_current_cursor = 'ComixCursors-White',
    $xfce_current_xfwm = 'Greybird',
    $appearance_pkgs = [ 'zukitwo-themes', 'xfce-theme-greybird', 'faenza-icon-theme', 'faience-icon-theme', 'xcursor-comix', 'compton', 'compiz', 'compass-icon-theme', 'numix-frost-themes' ],
) inherits envinstall::params {

  package { $appearance_pkgs: ensure => installed } ->

  exec { 'change_xfce_theme':
    user => $user,
    command => "xfconf-query -c xsettings -p /Net/ThemeName -s $xfce_current_theme",
    path => '/bin/:/usr/bin/',
    unless => "xfconf-query -c xsettings -p /Net/ThemeName | grep $xfce_current_theme",
  } ->

  exec { 'change_icon_theme':
    user => $user,
    command => "xfconf-query -c xsettings -p /Net/IconThemeName -s $xfce_current_icons",
    path => '/bin/:/usr/bin/',
    unless => "xfconf-query -c xsettings -p /Net/IconThemeName | grep $xfce_current_icons",
  } ->

  exec { 'change_cursor_theme':
    user => $user,
    command => "xfconf-query -c xsettings -p /Gtk/CursorThemeName -s $xfce_current_cursor",
    path => '/bin/:/usr/bin/',
    unless => "xfconf-query -c xsettings -p /Gtk/CursorThemeName | grep $xfce_current_cursor",
  } ->

  exec { 'change_xfwm_theme':
    user => user,
    command => "xfconf-query -c xfwm4 -p /general/theme -s $xfce_current_xfwm",
    path => '/bin/:/usr/bin/',
    unless => "xfconf-query -c xfwm4 -p /general/theme | grep $xfce_current_xfwm",
  } ->

  exec { 'change_notify_theme':
    user => user,
    command => "xfconf-query -c xfce4-notifyd -p /theme -s Greybird",
    path => '/bin/:/usr/bin/',
    unless => "xfconf-query -c xfce4-notifyd -p /theme | grep Greybird",
  }

  if ! defined(Vcsrepo['/tmp/common-files']) {
    vcsrepo { '/tmp/common-files':
      ensure => present,
      provider => git,
      source => 'https://github.com/sorrowless/common-files.git',
    }
  }

  file { '/home/$user/.config/autostart/compton.desktop':
    ensure => present,
    owner => $user,
    source => '/tmp/common-files/home/sbog/.config/autostart/compton.desktop',
    require => Vcsrepo['/tmp/common-files'],
  }

}
