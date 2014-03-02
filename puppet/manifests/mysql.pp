
class { "mysql":
  
  #version => '1.0.1', #optional
  root_password => 'vagrant',
}

mysql::grant { 'db1':
  mysql_privileges => 'ALL',
  mysql_password => 'pwd',
  mysql_db => 'db1',
  mysql_user => 'db1',
  mysql_host => 'localhost',
#mysql_db_init_query_file => '/full/path/to/the/schema.sql',
}