class compliance::profile::redhat (
  String $simp_version,
  Array $purge_unamanaged_resource_types
) {
  class {'compliance::profile::redhat::repositories':
    simp_version => $simp_version,
  }

  include 'aide'
  include 'auditd'

  # Virus scanning.
  include 'clamav'

  #Class['simplib'] expects this group to exist
  group { 'puppet':
    ensure => present,
  }
  # Ensuring reasonably sane defaults for both at and common.
  include 'simplib::at'
  include 'simplib::cron'
  include 'simplib::chkrootkit'
  include 'simplib::etc_default::nss'
  include 'simplib::etc_default::useradd'
  include 'simplib::host_conf'
  include 'simplib::incron'
  include 'simplib::issue'
  include 'simplib::libuser_conf'
  include 'simplib::login_defs'
  include 'simplib::localusers'
  include 'simplib::modprobe_blacklist'
  include 'simplib::nsswitch'
  include 'simplib::prelink'
  include 'simplib::profile_settings'
  include 'simplib::resolv'
  include 'simplib::secure_mountpoints'
  include 'simplib::sysconfig::init'
  include 'simplib::sysctl'
  include 'simplib::timezone'
  include 'ntpd'

  # Set up the access.conf basics, allow root locally and deny
  # everyone else from everywhere by default.
  include 'pam::access'

  include 'openldap::pam'

  # Enable 'wheel' access controls.
  include 'pam::wheel'

  # Make sure we manage selinux
  include 'selinux'

  # Set up the SSH server and client.
  include 'ssh'

  #Ruby is needed for the sudosh package
  include 'ruby'
  include 'sudosh'

  # We want to ensure that only the services we define in Puppet are
  # goig to be enabled and run.
  include 'svckill'

  # Add TPM support by default. This will grow over time but, if you have a
  # TPM, you most likely want to use it!
  include 'tpm'

  if $::os['family'] == 'RedHat' and $::os['release']['major'] == '6' {
    include 'acpid'
    include 'upstart'
  }

  #Take a list of resource types to purge and make sure any
  #unmanaged resources of each type are removed from the system
  $purge_unamanaged_resource_types.each |$type| {
    resources {$type:
      purge              => true,
      unless_system_user => true,
    }
  }

  Class['ruby'] -> Class['sudosh']
}
