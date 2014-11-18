# == Class softec_newrelic::params
#
# This class is meant to be called from softec_newrelic
# It sets variables according to platform
#
class softec_newrelic::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'softec_newrelic'
      $service_name = 'softec_newrelic'
    }
    'RedHat', 'Amazon': {
      $package_name = 'softec_newrelic'
      $service_name = 'softec_newrelic'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
