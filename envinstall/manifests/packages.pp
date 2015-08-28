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

 # gnome3 extensions:
 # hide top bar: https://extensions.gnome.org/extension/545/hide-top-bar/
 # applications menu: https://extensions.gnome.org/extension/6/applications-menu/
 # places status indicator: https://extensions.gnome.org/extension/8/places-status-indicator/
 # system monitor: https://extensions.gnome.org/extension/9/systemmonitor/
 # user themes: https://extensions.gnome.org/extension/19/user-themes/
 # maximus two: https://extensions.gnome.org/extension/844/maximus-two/
 # media player indicator: https://extensions.gnome.org/extension/55/media-player-indicator/
 #$gnome3_pkgs = [ 'gnome-session-properties' ]

 $notebook_pkgs = [ 'bumblebee' ]

 package { $pkgs: ensure => installed }

}

