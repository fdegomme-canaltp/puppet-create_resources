class create_resources::logstash::configfile (
  $list    = undef,
  $is_noop = $create_resources::is_noop,
) {

  $defaults = {
    noop   => $is_noop,
  }

  if $list {
    create_resources ( 'logstash::configfile', hiera_hash('create_resources::logstash::configfile::list'), $defaults )
  }

}
