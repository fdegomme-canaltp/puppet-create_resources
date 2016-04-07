class create_resources::user (
  $list    = undef,
  $ensure  = present,
  $is_noop = $create_resources::is_noop,
) {

  $defaults = {
    ensure => $ensure,
    noop   => $is_noop,
  }

  if $list {
    create_resources ( user, hiera_hash('create_resources::user::list'), $defaults )
  }

}
