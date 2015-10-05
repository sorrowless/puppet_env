# == Class: envinstall
#
# This class installs all needed packages for system.
# Today it assume only desktop env's.
#
# === Variables
#
# [*pkgs*]
#   Array of packages to be installed
#
# === Examples
#
#  class { 'packages': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmn@gmail.com>
#
# === Copyright
#
# Copyright 2014-2015 Stanislaw Bogatkin.
#
class envinstall {
  include envinstall::base

  include envinstall::packages
  include envinstall::common
  include envinstall::multimedia::audio
  include envinstall::multimedia::pictures
  include envinstall::multimedia::video

  #include envinstall::slim
  include envinstall::lightdm
  include envinstall::tint2

  include envinstall::appearance
  include envinstall::batticon
  include envinstall::hotkeys
  include envinstall::xkb_plugin
}

