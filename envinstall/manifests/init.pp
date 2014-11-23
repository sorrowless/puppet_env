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
# Copyright 2014 Stanislaw Bogatkin.
#
class envinstall {

  include envinstall::appearance
  include envinstall::hotkeys
  include envinstall::xkb_plugin
}

