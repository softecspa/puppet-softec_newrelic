# == Class softec_newrelic::install
#
class softec_newrelic::install {

  package { $softec_newrelic::package_name:
    ensure => present,
  }
}
