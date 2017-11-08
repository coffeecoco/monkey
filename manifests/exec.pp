class monkey::exec {


exec { 'postgres auth=indent':
  path => '/usr/sbin/',
  command     => '/sbin/runuser -l postgres -c "/usr/bin/initdb --pgdata=/var/lib/pgsql/data --auth=ident"',
    logoutput => 'on_failure',
#  refreshonly => true,
  notify => Exec['/usr/sbin/pgsetup.sh'],
 returns => ['127','1']
}
 
#exec { 'postgres init':
#  path => '/usr/sbin/',
#  command     => '/sbin/runuser -l postgres -c "/usr/bin/postgres -D /var/lib/pgsql/data -p 5432 &"',
#  refreshonly => true,
#  
#}

exec { '/usr/sbin/pgsetup.sh':
  path => '/usr/sbin/',
  command     => "/usr/sbin/pgsetup.sh",
#  refreshonly => true,
  notify => Exec['/usr/sbin/smsetup.sh']  
}

vcsrepo { '/usr/local/src/security_monkey/':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/Netflix/security_monkey.git',
  revision => 'master',
}

 
exec { '/usr/sbin/smsetup.sh':
  path => ['/usr/sbin/', '/sbin', '/bin'],
  command     => "/usr/sbin/smsetup.sh",
    logoutput => 'on_failure',
#  refreshonly => true,        
notify => File["/usr/local/src/security_monkey/security_monkey/static/"]
}  

#$secmonkey_dirs = [
#'/usr/local/src/security_monkey/',        
#'/usr/local/src/security_monkey/security_monkey/',
#'/usr/local/src/security_monkey/security_monkey/static/',
# ]

  file { '/usr/local/src/security_monkey/security_monkey/static/':
    ensure => 'directory',
    owner  => 'nginx',
    mode   => '0750',           
    require => [Package['nginx']],
  }

exec { '/usr/sbin/dartsetup.sh':          
  path => ['/usr/sbin/', '/sbin', '/bin'],
  command     => "/usr/sbin/dartsetup.sh",          
#  refreshonly => true,
  notify => Exec['/usr/sbin/secmonkey_config.sh'],
}
  exec { '/usr/sbin/secmonkey_config.sh':          
#  path => '/usr/sbin/',
  command     => "/usr/sbin/secmonkey_config.sh",          
#  refreshonly => true,
    logoutput => 'on_failure',
  notify => Exec['/usr/sbin/nginxsetup.sh']
}
  exec { '/usr/sbin/nginxsetup.sh':          
#  path => '/usr/sbin/',
  command     => "/usr/sbin/nginxsetup.sh",          
#  refreshonly => true,
}

  exec { '/usr/sbin/botocfg.sh':          
#  path => '/usr/sbin/',
  command     => "/usr/sbin/botocfg.sh",          
#  refreshonly => true,
}  


  exec { 'export PYTHONPATH':
 path        => [                         
'/sbin',
'/bin',
'/usr/sbin',
'/usr/bin',           
'/usr/lib/dart/bin',
'/opt/puppetlabs/bin',  
],
  command     => "/bin/sh -c 'export PYTHONPATH=/usr/local/src/security_monkey  >> /usr/sbin/sm_environment.env'",
#  refreshonly => true,
}  

  exec { 'export SECURITY_MONKEY_SETTINGS':
 path        => [
'/sbin',
'/bin',
'/usr/sbin',
'/usr/bin',             
'/usr/lib/dart/bin',
'/opt/puppetlabs/bin',
],
  command     => "/bin/sh -c 'export SECURITY_MONKEY_SETTINGS=/usr/local/src/security_monkey/env-config/config-deploy.py >> /usr/sbin/sm_environment.env'",       
#  refreshonly => true,
}

#service { 'supervisord':
#  ensure => 'running',
#  enable => 'true',
#}

exec { '/usr/sbin/sm_api_server.sh':
  path => ['/usr/sbin/', '/sbin', '/bin'],
  command     => "/usr/sbin/sm_api_server.sh",
  logoutput => 'on_failure',
}

exec { '/usr/sbin/sm_scheduler.sh':
  path => ['/usr/sbin/', '/sbin', '/bin'],
  command     => "/usr/sbin/sm_scheduler.sh",
  logoutput => 'on_failure',
}



}
