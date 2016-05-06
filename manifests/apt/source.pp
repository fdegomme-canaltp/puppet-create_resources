class create_resources::apt::source (
  $list    = undef,
  $is_noop = $create_resources::is_noop,
) {

  $defaults = {
    noop   => $is_noop,
  }

  if $list {
    create_resources ( yumrepo, hiera_hash('create_resources::apt::source::list'), $defaults )
  }

}
