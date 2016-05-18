class create_resources::apt::key (
  $list    = undef,
  $is_noop = $create_resources::is_noop,
) {

  $defaults = {
    noop   => $is_noop,
  }

  if $list {
    create_resources ( 'apt::key', hiera_hash('create_resources::apt::key::list'), $defaults )
  }

}
