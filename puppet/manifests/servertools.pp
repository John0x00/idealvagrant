class servertools{
	$default_packages = [ 'htop', 'mtop', 'vim' ]
	package { $default_packages :
		ensure => present,
	}
}