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

 $pkgs = [ 'pulseaudio', 'pulseaudio-alsa', 'paprefs', 'pavucontrol', 'pasystray-git', 'xfce4-volumed', 'gstreamer0.10-good-plugins', 'plank', 'plank-config', 'compton', 'cairo-infinality-ultimate', 'fontconfig-infinality-ultimate', 'freetype2-infinality-ultimate', 'xnviewmp', 'xatk', 'rosa-media-player', 'rygel', 'transmission-gtk', 'transmission-remote-gui-bin', 'doublecmd-gtk2', 'nethogs', 'tmux' ]

 $notebook_pkgs = [ 'bumblebee' ]

 package { $pkgs: ensure => installed }

}

