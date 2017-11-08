	runuser -l postgres -c '/usr/bin/initdb --pgdata=/var/lib/pgsql/data --auth=ident'

runuser -l postgres -c '/usr/bin/postgres -D /var/lib/pgsql/data -p 5432 &' && \
	sleep 10; ps ax | grep postgres && \
	chmod +x /usr/sbin/pgsetup.sh && \
	bash -x /usr/sbin/pgsetup.sh 

/usr/sbin/smsetup.sh

/usr/sbin/dartsetup.sh
/usr/sbin/secmonkey_config.sh
cp securitymonkey.conf /etc/nginx/sites-available/securitymonkey.conf
/usr/sbin/nginxsetup.sh
RUN echo -e "export PYTHONPATH=\"/usr/local/src/security_monkey\"\nexport SECURITY_MONKEY_SETTINGS=\"/usr/local/src/security_monkey/env-config/config-deploy.py\"" > /usr/sbin/sm_environment.env
COPY supervisord.conf /etc/supervisor.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-n", "-c/etc/supervisor.d/supervisord.conf"]



exec { '/usr/sbin/pgsetup.sh':
  path => '/usr/sbin/',
  command     => "/usr/sbin/pgsetup.sh",
  refreshonly => true,
}
exec { '/usr/sbin//usr/sbin/smsetup.sh':
  path => '/usr/sbin/',          
  command     => "/usr/sbin/smsetup.sh",
  refreshonly => true,        
}  
exec { '/usr/sbin/dartsetup.sh':          
  path => '/usr/sbin/',
  command     => "/usr/sbin/dartsetup.sh",          
  refreshonly => true,
}
  exec { '/usr/sbin/secmonkey_config.sh':          
  path => '/usr/sbin/',
  command     => "/usr/sbin/secmonkey_config.sh",          
  refreshonly => true,
}
  exec { '/usr/sbin/nginxsetup.sh':          
  path => '/usr/sbin/',
  command     => "/usr/sbin/nginxsetup.sh",          
  refreshonly => true,
}

  exec { '/usr/sbin/botocfg.sh':          
  path => '/usr/sbin/',
  command     => "/usr/sbin/botocfg.sh",          
  refreshonly => true,
}  


  exec { 'export PYTHONPATH':
  path => '/usr/sbin/',       
  command     => "export PYTHONPATH=\"/usr/local/src/security_monkey\  > /usr/sbin/sm_environment.env",
  refreshonly => true,
}  

  exec { 'export SECURITY_MONKEY_SETTINGS':
  path => '/usr/sbin/',
  command     => "export SECURITY_MONKEY_SETTINGS=/usr/local/src/security_monkey/env-config/config-deploy.py > /usr/sbin/sm_environment.env",       
  refreshonly => true,
}

CMD ["/usr/bin/supervisord", "-n", "-c/etc/supervisor.d/supervisord.conf"]
  exec { 'supervisord':
  path => '/usr/sbin/',
  command     => 'supervisord -n -c /etc/supervisord.conf'
  refreshonly => true,
}
