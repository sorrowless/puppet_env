# == Class: base
#
class envinstall::base {
  user { 'sbog':
   ensure => present,
   uid => 1000,
   managehome => true,
   home => '/home/sbog',
   password => 'test',
  }
}

