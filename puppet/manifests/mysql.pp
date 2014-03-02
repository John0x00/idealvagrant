
class { "mysql":
  
  #version => '1.0.1', #optional
  root_password => 'vagrant',
}

mysql::grant { 'vagrant':
  mysql_privileges => 'ALL',
  mysql_password => 'vagrant',
  mysql_db => 'vagrant',
  mysql_user => 'vagrant',
  mysql_host => 'localhost',
#mysql_db_init_query_file => '/full/path/to/the/schema.sql',
}