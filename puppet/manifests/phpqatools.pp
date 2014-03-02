class phpqatools{
	
	php::module { "xdebug": 
		require => Package[php],
		notify  => Service[apache]
	}
	
	php::pear::module { 'PHPUnit':
		require => Package[php],
		notify  => Service[apache],
		repository  => 'pear.phpunit.de',
		use_package => 'no',
	}

}