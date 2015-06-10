# == Class: packages
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
class envinstall::packages {

 $pkgs = [ 'plank', 'plank-config', 'cairo-infinality-ultimate', 'fontconfig-infinality-ultimate', 'freetype2-infinality-ultimate', 'xatk', 'transmission-gtk', 'transmission-remote-gtk-git', 'doublecmd-gtk2', 'nethogs', 'tmux', 'wireshark', 'acroread', 'keepassx', 'keepassx-faenza-icons', 'glances', 'wget' ]

 $extra_pkgs = [ 'moka-icon-theme-git', 'numix-circle-icon-theme-git' ]

 $notebook_pkgs = [ 'bumblebee' ]

 package { $pkgs: ensure => installed }

}

