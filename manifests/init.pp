class compliance::profile(
  String $simp_repository_version,
  Array $purge_unamanaged_resource_types = [
    'firewall',
    'user'
  ],
) {
  validate_re($simp_repository_version,'^\d+.\d+.X', "The simp_repository_version parameter must be in the format MAJOR.MINOR.X")

  #Make sure we're on a supported OS. Don't fail if not. Just print a message
  if $os['family'] == 'RedHat' {
    #Include in the Red Hat compliant classes
    class { 'compliance::profile::redhat':
      simp_version                    => $simp_repository_version,
      purge_unamanaged_resource_types => $purge_unamanaged_resource_types,
    }
  } else {
    notice ("The compliance::profile module currently only supports Red Hat based Linux distributions")
  }
}
