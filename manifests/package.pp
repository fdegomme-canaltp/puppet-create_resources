class create_resources::package (
  $package_name   = $create_resources::package_list,
  $package_ensure = $create_resources::package_ensure,
  $is_noop        = $create_resources::is_noop,
) {

  $defaults = {
    ensure => $package_ensure,
    noop   => $is_noop,
  }

  if $package_name {
    create_resources ( package, hiera_hash('create_resources::package_name'), $defaults )
  }

}
