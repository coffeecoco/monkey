file { '/var/log/security_monkey':
  ensure => 'directory',
  ctime  => '2017-11-06 12:40:01 +0000',
  group  => '48',
  mode   => '0755',
  mtime  => '2017-11-06 10:10:58 +0000',
  owner  => '48',
  type   => 'directory',
}
file { '/var/log/security_monkey/security_monkey.error.log':
  ensure  => 'file',
  content => '{md5}4ac9098a261cdf427e8cca96c7c66e2b',
  ctime   => '2017-11-07 10:49:37 +0000',
  group   => '994',
  mode    => '0777',
  mtime   => '2017-11-07 10:49:37 +0000',
  owner   => '997',
  type    => 'file',
}
file { '/var/log/security_monkey/security_monkey-deploy.log':
  ensure  => 'file',
  content => '{md5}d41d8cd98f00b204e9800998ecf8427e',
  ctime   => '2017-11-06 12:40:01 +0000',
  group   => '994',
  mode    => '0777',
  mtime   => '2017-11-06 12:40:01 +0000',
  owner   => '48',
  type    => 'file',
}
file { '/var/log/security_monkey/security_monkey.access.log':
  ensure  => 'file',
  content => '{md5}415d8911e4509a8c3258c979e5bcdb8f',
  ctime   => '2017-11-08 01:13:21 +0000',
  group   => '994',
  mode    => '0644',
  mtime   => '2017-11-08 01:13:21 +0000',
  owner   => '997',
  type    => 'file',
}
file { '/var/www':
  ensure => 'directory',
  ctime  => '2017-11-06 12:40:01 +0000',
  group  => '0',
  mode   => '0755',
  mtime  => '2017-11-06 09:27:51 +0000',
  owner  => '48',
  type   => 'directory',
}
file { '/usr/sbin/nginxsetup.sh':
  ensure  => 'file',
  content => '{md5}c2b26608ccb1b33e2246bb89b353d202',
  ctime   => '2017-11-06 09:49:23 +0000',
  group   => '0',
  mode    => '0755',
  mtime   => '2017-11-06 09:41:51 +0000',
  owner   => '0',
  type    => 'file',
}
file { '/usr/sbin/pgsetup.sh':
  ensure  => 'file',
  content => '{md5}6bca44b601555d4d8018288d2956f455',
  ctime   => '2017-11-06 10:11:36 +0000',
  group   => '0',
  mode    => '0755',
  mtime   => '2017-11-06 09:41:51 +0000',
  owner   => '0',
  type    => 'file',
}
file { '/usr/sbin/smsetup.sh':
  ensure  => 'file',
  content => '{md5}9ed1961abdbf11f590cba0d298febc8d',
  ctime   => '2017-11-06 13:20:05 +0000',
  group   => '0',
  mode    => '0755',
  mtime   => '2017-11-06 13:20:05 +0000',
  owner   => '0',
  type    => 'file',
}
file { '/usr/sbin/dartsetup.sh':
  ensure  => 'file',
  content => '{md5}6716386a1c10fb59194dc91c122cae5c',
  ctime   => '2017-11-06 10:14:26 +0000',
  group   => '0',
  mode    => '0755',
  mtime   => '2017-11-06 09:41:51 +0000',
  owner   => '0',
  type    => 'file',
}
file { '/usr/sbin/secmonkey_config.sh':
  ensure  => 'file',
  content => '{md5}323e7208063190a4c6012ecdc2cbf3ef',
  ctime   => '2017-11-06 10:15:22 +0000',
  group   => '0',
  mode    => '0755',
  mtime   => '2017-11-06 10:10:23 +0000',
  owner   => '0',
  type    => 'file',
}
file { '/usr/sbin/nginxsetup.sh':
  ensure  => 'file',
  content => '{md5}c2b26608ccb1b33e2246bb89b353d202',
  ctime   => '2017-11-06 09:49:23 +0000',
  group   => '0',
  mode    => '0755',
  mtime   => '2017-11-06 09:41:51 +0000',
  owner   => '0',
  type    => 'file',
}
file { '/usr/sbin/sm_scheduler.sh':
  ensure  => 'file',
  content => '{md5}1660e190ab7b4bf44e36c99cf68a1111',
  ctime   => '2017-11-06 11:08:18 +0000',
  group   => '0',
  mode    => '0755',
  mtime   => '2017-11-06 11:08:18 +0000',
  owner   => '0',
  type    => 'file',
}
