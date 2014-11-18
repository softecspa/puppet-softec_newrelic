# == Class: softec_newrelic
#
# Full description of class softec_newrelic here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class softec_newrelic (
  $package_name = $softec_newrelic::params::package_name,
  $service_name = $softec_newrelic::params::service_name,
) inherits softec_newrelic::params {

  # validate parameters here

  class { 'softec_newrelic::install': } ->
  class { 'softec_newrelic::config': } ~>
  class { 'softec_newrelic::service': } ->
  Class['softec_newrelic']
}
