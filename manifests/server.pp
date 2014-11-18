class softec_newrelic::server (
  $newrelic_user_uid,
  $newrelic_license_key = hiera('newrelic_license_key'),
  $newrelic_group_gid   = ''
) {

  $group_gid = $newrelic_group_gid? {
    ''      => $newrelic_user_uid,
    default => $newrelic_group_gid
  }

  if !is_integer($newrelic_user_uid) {
    fail('newrelic_user_uid must be an integer value')
  }

  if !is_integer($group_gid) {
    fail('newrelic_group_gid must be an integer value')
  }

  group{'newrelic':
    ensure  => present,
    gid     => $group_gid
  } ->

  user{'newrelic':
    ensure  => present,
    gid     => $group_gid,
    uid     => $newrelic_user_uid,
  } ->

  class {'newrelic::server::linux':
    newrelic_license_key  => $newrelic_license_key
  }

}
