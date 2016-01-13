class compliance::profile(
  String $simp_repository_version,
  Array $purge_unamanaged_resource_types = [
    'firewall',
    'user'
  ],
  Boolean $use_ldap = true,
) {
  validate_re($simp_repository_version,'^\d+.\d+.X', "The simp_repository_version parameter must be in the format MAJOR.MINOR.X")

  #Make sure we're on a supported OS. Don't fail if not. Just print a message
  if $os['family'] == 'RedHat' {
    #Include in the Red Hat compliant classes
    class { 'compliance::profile::redhat':
      simp_version                    => $simp_repository_version,
      purge_unamanaged_resource_types => $purge_unamanaged_resource_types,
      use_ldap                        => $use_ldap,
    }
  } else {
    notice ("The compliance::profile module currently only supports Red Hat based Linux distributions")
  }

  # See the user.pp file for an example of this defined type
  compliance::user { 'vagrant':
    authorized_keys => [
      'AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==',
      'AAAAB3NzaC1yc2EAAAADAQABAAABAQDi2asNYR6PE5B4/ZkgrcxBZdZ/xazgZG1qu/g95womT3D8fK57wxpaO19Pw04e/YCz5KoasXfRWy8WC9BV8J9NNQ0orgsjlMcW6ACcdN8yhNYeQS2UdkSUfVEBrvBHe6yf56qCwa7HaneyDv544hnR4OtJsByGCeB/SZFNZcFqhYNhDyzQExO0VXdcHZbYr5yKfBaVeT4j1Zbq4wXKMtAH5tsEc3bwKVKtfY43jwgOzioQhujahob/9huHEHiixRwrKXDzgUu2yiMRADA6dRVDmY60hikIboxa4qDywcaGXaQsF03VSTuijygmBWJEEOpfLj4BZBnPRS4aG9gO62HD',
    ],
  }
}
