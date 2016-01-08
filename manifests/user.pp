define compliance::user(
  $ensure                 = 'present',
  $managehome             = true,
  $purge_ssh_keys         = true,
  $home                   = "/home/$title",
  $allowed_access_origins = ['ALL'],
  $authorized_keys        = [],
) {

  user { $title:
    ensure         => $present,
    home           => $home,
    managehome     => $managehome,
    purge_ssh_keys => $purge_ssh_keys,
  }

  pam::access::manage { $title:
    origins => $allowed_access_origins,
    users   => $title,
  }

  $authorized_keys.each |Integer $index, String $key| {
    ssh_authorized_key { "${title}_${index}":
      user => $title,
      type => 'ssh-rsa',
      key  => $key,
    }
  }
}
