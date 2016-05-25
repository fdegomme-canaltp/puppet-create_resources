class create_resources::yumrepo (
  $list    = undef,
  $ensure  = present,
  $is_noop = $create_resources::is_noop,
) {

  $defaults = {
    ensure => $ensure,
    noop   => $is_noop,
  }

  if $list {
    create_resources ( yumrepo, hiera_hash('create_resources::yumrepo::list'), $defaults )
  }

}
