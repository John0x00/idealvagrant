class { 'php': 
 #version => '1.0.1',
}

php::module { "curl": }
php::module { "mysql": }
php::module { "dev": }
php::module { "cli": }


php::pear::module { 'phing':
  repository  => 'pear.phing.info',
  require => Package[php],
  notify  => Service[apache],
  use_package => 'no',
}

file {'/etc/php5/conf.d/upload_limits.ini':
  ensure => present,
  require => Package[php],
  notify  => Service[apache],
  owner => root, group => root, mode => 444,
  content => "post_max_size = 10M \nupload_max_filesize = 10M \n",
}

file {'/etc/php5/conf.d/dev_settings.ini':
  require => Package[php],
  ensure => present,
  owner => root, group => root, mode => 444,
  content => "display_errors = On \nhtml_errors = On \n",
}


#define set_php_var($value) {
#  exec { "sed -i 's/^;*[[:space:]]*$name[[:space:]]*=.*$/$name = $value/g' /etc/php5/cli/php.ini":
#    unless  => "grep -xqe '$name[[:space:]]*=[[:space:]]*$value' -- /etc/php5/cli/php.ini",
#    path    => "/bin:/usr/bin",
#    require => Package[php],
#    notify  => Service[apache];
#  }
#}
#set_php_var {
#  "post_max_size":       value => '10M';
#  "upload_max_filesize": value => '10M';
#}