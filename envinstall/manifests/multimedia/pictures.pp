# == Class: pictures
#
# This class installs and configure picture-related things.
#
# === Variables
#
# [*pkgs*]
#   Array of packages to be installed
#
# === Examples
#
#  class { 'pictures': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmn@gmail.com>
#
# === Copyright
#
# Copyright 2015 Stanislaw Bogatkin.
#
class envinstall::multimedia::pictures {

  $viewers_pkgs = [ 'xnviewmp', 'feh' ]

  package { $viewers_pkgs:
    ensure => installed,
  }

}
