# == Class softec_newrelic::service
#
# This class is meant to be called from softec_newrelic
# It ensure the service is running
#
class softec_newrelic::service {

  service { $softec_newrelic::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
