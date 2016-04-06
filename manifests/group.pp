class create_resources::group (
  $group_list   = $create_resources::group_list,
  $group_ensure = $create_resources::group_ensure,
  $is_noop      = $create_resources::is_noop,
) {

  $defaults = {
    ensure => $group_ensure,
    noop   => $is_noop,
  }

  if $group_list {
    create_resources ( group, hiera_hash('create_resources::group_list'), $defaults )
  }

}
