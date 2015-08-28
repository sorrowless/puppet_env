# == Class: xfce4
#
class envinstall::xfce4 {
 
 $packages = [ 'xfce4', 'xfce4-goodies']
 
 class { 'envinstall::xorg': } ->
 package { $packages: ensure => installed }

}

