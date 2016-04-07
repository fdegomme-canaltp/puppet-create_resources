class create_resources::group (
  $list    = undef,
  $ensure  = present,
  $is_noop = $create_resources::is_noop,
) {

  $defaults = {
    ensure => $ensure,
    noop   => $is_noop,
  }

  if $list {
    create_resources ( group, hiera_hash('create_resources::group::list'), $defaults )
  }

}
