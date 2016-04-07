class create_resources::package (
  $list    = undef,
  $ensure  = installed,
  $is_noop = $create_resources::is_noop,
) {

  $defaults = {
    ensure => $ensure,
    noop   => $is_noop,
  }

  if $list {
    create_resources ( package, hiera_hash('create_resources::package::list'), $defaults )
  }

}
