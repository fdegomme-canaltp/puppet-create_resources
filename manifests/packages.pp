class create_resources::packages (
  $packages_list   = $create_resources::packages_list,
  $packages_ensure = $create_resources::packages_ensure,
  $is_noop         = $create_resources::if_noop,
) {

  $defaults = {
    ensure => $packages_ensure,
    noop   => $if_noop,
  }

  if $packages_list {
    create_resources ( package, hiera_hash('create_resources::packages_list'), $defaults )
  }

}
