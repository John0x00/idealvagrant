class { "apache": }

apache::vhost { 'default':
    docroot             => '/vagrant/web',
    server_name         => false,
    priority            => '',
    template            => 'apache/virtualhost/vhost.conf.erb',
}