# This is an example Puppetfile to include all the core modules from the NSA's
# System Integrity Monitoring Platform (SIMP) set of modules purpose built for
# managing systems in a regulatory compliant way.
forge "https://forgeapi.puppetlabs.com"

#Puppet Labs core infrastructure modules
mod 'puppetlabs/stdlib'
mod 'puppetlabs/inifile'
mod 'puppetlabs/concat'
mod 'puppetlabs/ntp'
mod 'puppetlabs/firewall'
mod 'puppetlabs/ruby'

#Community Modules
mod 'stahnma/epel'

# Augeas lense providers
mod 'herculesteam/augeasproviders'
mod 'herculesteam/augeasproviders_apache'
mod 'herculesteam/augeasproviders_base'
mod 'herculesteam/augeasproviders_core'
mod 'herculesteam/augeasproviders_grub'
mod 'herculesteam/augeasproviders_mounttab'
mod 'herculesteam/augeasproviders_nagios'
mod 'herculesteam/augeasproviders_pam'
mod 'herculesteam/augeasproviders_postgresql'
mod 'herculesteam/augeasproviders_puppet'
mod 'herculesteam/augeasproviders_shellvar'
mod 'herculesteam/augeasproviders_ssh'
mod 'herculesteam/augeasproviders_sysctl'

# SIMP modules
mod 'simplib',
  :git => 'https://github.com/simp/pupmod-simp-simplib'


#NSA regulatory compliant modules
#These modules are only compatible with
# RHEL based Linux distros
mod 'acpid',
  :git => 'https://github.com/simp/pupmod-simp-acpid'
mod 'aide',
  :git => 'https://github.com/simp/pupmod-simp-aide'
mod 'auditd',
  :git => 'https://github.com/simp/pupmod-simp-auditd'
mod 'autofs',
  :git => 'https://github.com/simp/pupmod-simp-autofs'
mod 'clamav',
  :git => 'https://github.com/simp/pupmod-simp-clamav'
mod 'dhcp',
  :git => 'https://github.com/simp/pupmod-simp-dhcp'
mod 'freeradius',
  :git => 'https://github.com/simp/pupmod-simp-freeradius'
mod 'libvirt',
  :git => 'https://github.com/simp/pupmod-simp-libvirt'
mod 'logrotate',
  :git => 'https://github.com/simp/pupmod-simp-logrotate'
mod 'mcafee',
  :git => 'https://github.com/simp/pupmod-simp-mcafee'
mod 'mozilla',
  :git => 'https://github.com/simp/pupmod-simp-mozilla'
mod 'named',
  :git => 'https://github.com/simp/pupmod-simp-named'
mod 'network',
  :git => 'https://github.com/simp/pupmod-simp-network'
mod 'nfs',
  :git => 'https://github.com/simp/pupmod-simp-nfs'
mod 'nscd',
  :git => 'https://github.com/simp/pupmod-simp-nscd'
mod 'ntpd',
  :git => 'https://github.com/simp/pupmod-simp-ntpd'
mod 'oddjob',
  :git => 'https://github.com/simp/pupmod-simp-oddjob'
mod 'openldap',
  :git => 'https://github.com/simp/pupmod-simp-openldap'
mod 'openscap',
  :git => 'https://github.com/simp/pupmod-simp-openscap'
mod 'pam',
  :git => 'https://github.com/simp/pupmod-simp-pam'
mod 'pki',
  :git => 'https://github.com/simp/pupmod-simp-pki'
mod 'polkit',
  :git => 'https://github.com/simp/pupmod-simp-polkit'
mod 'postfix',
  :git => 'https://github.com/simp/pupmod-simp-postfix'
mod 'pupmod',
  :git => 'https://github.com/simp/pupmod-simp-pupmod'
mod 'rsync',
  :git => 'https://github.com/simp/pupmod-simp-rsync'
mod 'rsyslog',
  :git => 'https://github.com/simp/pupmod-simp-rsyslog'
mod 'selinux',
  :git => 'https://github.com/simp/pupmod-simp-selinux'
mod 'snmpd',
  :git => 'https://github.com/simp/pupmod-simp-snmpd'
mod 'ssh',
  :git => 'https://github.com/simp/pupmod-simp-ssh'
mod 'sssd',
  :git => 'https://github.com/simp/pupmod-simp-sssd'
mod 'stunnel',
  :git => 'https://github.com/simp/pupmod-simp-stunnel'
mod 'sudo',
  :git => 'https://github.com/simp/pupmod-simp-sudo'
mod 'sudosh',
  :git => 'https://github.com/simp/pupmod-simp-sudosh'
mod 'svckill',
  :git => 'https://github.com/simp/pupmod-simp-svckill'
mod 'sysctl',
  :git => 'https://github.com/simp/pupmod-simp-sysctl'
mod 'tcpwrappers',
  :git => 'https://github.com/simp/pupmod-simp-tcpwrappers'
mod 'tftpboot',
  :git => 'https://github.com/simp/pupmod-simp-tftpboot'
mod 'tmp',
  :git => 'https://github.com/simp/pupmod-simp-tpm'
mod 'upstart',
  :git => 'https://github.com/simp/pupmod-simp-upstart'
mod 'vnc',
  :git => 'https://github.com/simp/pupmod-simp-vnc'
mod 'vsftpd',
  :git => 'https://github.com/simp/pupmod-simp-vsftpd'
mod 'windowmanager',
  :git => 'https://github.com/simp/pupmod-simp-windowmanager'
mod 'xinetd',
  :git => 'https://github.com/simp/pupmod-simp-xinetd'
mod 'xwindows',
  :git => 'https://github.com/simp/pupmod-simp-xwindows'
mod 'tpm',
  :git => 'https://github.com/simp/pupmod-simp-tpm'
mod 'simpcat',
  :git => 'https://github.com/simp/pupmod-simp-concat'
