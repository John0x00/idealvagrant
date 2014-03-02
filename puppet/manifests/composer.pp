
exec { 'composer.phar':
  command => 'curl -sS https://getcomposer.org/installer | php',
  cwd     => '/usr/local/bin',
  creates => '/usr/local/bin/composer.phar',
  timeout => 0,
  require => [Package['php5-cli'], Package['curl']]
}

exec { 'composer-run':
  command     => '/usr/local/bin/composer.phar install --dev --prefer-dist',
  cwd         => '/vagrant/',
  environment => 'COMPOSER_HOME=/root/',
  timeout     => 0,
  require     => [Package['git'], Package['php5-cli'], Exec['composer.phar']]
}