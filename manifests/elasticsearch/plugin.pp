class create_resources::elasticsearch::plugin (
  $list    = undef,
  $is_noop = $create_resources::is_noop,
) {

  $defaults = {
    noop   => $is_noop,
  }

  if $list {
    create_resources ( 'elasticsearch::plugin', hiera_hash('create_resources::elasticsearch::plugin::list'), $defaults )
  }

}
