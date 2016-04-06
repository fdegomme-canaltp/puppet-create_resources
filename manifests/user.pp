class create_resources::user (
  $user_list   = $create_resources::user_list,
  $user_ensure = $create_resources::user_ensure,
  $is_noop     = $create_resources::is_noop,
) {

  $defaults = {
    ensure => $user_ensure,
    noop   => $is_noop,
  }

  if $user_list {
    create_resources ( user, hiera_hash('create_resources::user_list'), $defaults )
  }

}
