Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
File { owner => 0, group => 0, mode => 0644 }
stage { 'first': }
stage { 'last': }
Stage['first'] -> Stage['main'] -> Stage['last']

import 'basic.pp'
import 'mysql.pp'
import 'apache.pp'
import 'php.pp'
import 'composer.pp'
import 'phpqatools.pp'
import 'servertools.pp'

class{'basic':
  stage => first
}