class compliance::profile::redhat::repositories (
  String $simp_version,
) {
  yumrepo {'simp-packages':
    ensure   => present,
    baseurl  => "http://dl.bintray.com/simp/${simp_version}",
    gpgcheck => 0,
    exclude  => [
      'mcollective.*',
      'puppet.*',
      'hiera.*',
      'puppet.*',
      'pupmod.*',
      'razor',
      'simp'
    ]
  }
}
