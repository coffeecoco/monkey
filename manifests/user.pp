class monkey::user {

group { 'nginx':
  ensure => 'present',
  gid    => '1002',
}

user { 'nginx':
  ensure           => 'present',
#  gid              => '1002',
  groups           => ['nginx'],
  password         => '!!',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '1002',
}


user { 'monkey':
  ensure           => 'present',
#  gid              => '1001',
  groups           => ['wheel'],
  home             => '/home/monkey',
  password         => '!!',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '1001',
}

}
