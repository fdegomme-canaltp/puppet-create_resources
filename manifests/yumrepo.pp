class create_resources::yumrepo (
  $yumrepo_list   = $create_resources::yumrepo_list,
  $yumrepo_ensure = $create_resources::yumrepo_ensure,
  $is_noop        = $create_resources::is_noop,
) {

  $defaults = {
    ensure => $yumrepo_ensure,
    noop   => $is_noop,
  }

  if $yumrepo_list {
    create_resources ( yumrepo, hiera_hash('create_resources::yumrepo_list'), $defaults )
  }

}
