# == Class: asroot
#
# This class installs all that explicitly need root access
#
# === Variables
#
# [*pkgs*]
#   Array of packages to be installed
#
# === Examples
#
#  class { 'asroot': }
#
# === Authors
#
# Stanislaw Bogatkin <stabog.tmn@gmail.com>
#
# === Copyright
#
# Copyright 2014 Stanislaw Bogatkin.
#
class envinstall::asroot {

  include envinstall::slim
  include envinstall::packages

}

