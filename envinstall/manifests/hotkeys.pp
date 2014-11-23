# == Class: hotkeys
#
# This class installs and configure hotkeys.
#
# === Variables
#
# [*pkgs*]
#   Array of packages to be installed
#
# === Examples
#
#  class { 'hotkeys': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmn@gmail.com>
#
# === Copyright
#
# Copyright 2014 Stanislaw Bogatkin.
#
class envinstall::hotkeys {

  package { 'xfconf': ensure => installed } ->

  exec { 'slimlock':
    command => "xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>l' -n -t string -s slimlock",
    path => '/bin/:/usr/bin/',
    unless => "xfconf-query -c xfce4-keyboard-shortcuts -p '/commands/custom/<Super>l' | grep slimlock",
  }

  exec { 'ws1':
    command => "xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>1' -n -t string -s workspace_1_key",
    path => '/bin/:/usr/bin/',
    unless => "xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>1' | grep workspace_1_key",
  }

  exec { 'ws2':
    command => "xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>2' -n -t string -s workspace_2_key",
    path => '/bin/:/usr/bin/',
    unless => "xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>2' | grep workspace_2_key",
  }

  exec { 'ws3':
    command => "xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>3' -n -t string -s workspace_3_key",
    path => '/bin/:/usr/bin/',
    unless => "xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>3' | grep workspace_3_key",
  }

  exec { 'ws4':
    command => "xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>4' -n -t string -s workspace_4_key",
    path => '/bin/:/usr/bin/',
    unless => "xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Super>4' | grep workspace_4_key",
  }

}
