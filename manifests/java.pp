class softec_newrelic::java (
  $newrelic_java_plugin_path  = '/opt/newrelic',
  $newrelic_license_key       = hiera('newrelic_license_key'),
  $newrelic_java_appname      = undef,
  $java_version,
) {

  validate_absolute_path($newrelic_java_plugin_path)

  $plugin_source = $java_version?{
    '6' => 'puppet:///modules/newrelic/java67_plugin/',
    '7' => 'puppet:///modules/newrelic/java67_plugin/',
    '8' => 'puppet:///modules/newrelic/java8_plugin/',
  }

  file {$newrelic_java_plugin_path :
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0775',
    source  => $plugin_source,
    recurse => 'remote',
  }

  file {"${newrelic_java_plugin_path}/newrelic.yml":
    owner   => 'root',
    group   => 'root',
    mode    => '0664',
    content => template('softec_newrelic/newrelic.yml.erb')
  }

}
