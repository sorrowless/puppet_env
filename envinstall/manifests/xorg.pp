# == Class: xorg
#
class envinstall::xorg {
 # fixme (sbog): find videocard and install packages for xorg with driver for it

 $packages = [ 'xorg-server' ]
 
 package { $packages: ensure => installed }

}

