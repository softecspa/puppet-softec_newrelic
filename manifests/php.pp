class softec_newrelic::php (
  $newrelic_license_key = hiera('newrelic_license_key'),
  $newrelic_ini_appname = undef,
) {

  class {'newrelic::agent::php':
    newrelic_license_key  => $newrelic_license_key,
    newrelic_ini_appname  => $newrelic_ini_appname,
    require               => Class['newrelic::server::linux']
  }

}
