class create_resources::yumrepo (
  $yumrepo_name   = $create_resources::yumrepo_name,
  $yumrepo_ensure = $create_resources::yumrepo_ensure,
  $is_noop        = $create_resources::is_noop,
) {

  $defaults = {
    ensure => $yumrepo_ensure,
    noop   => $is_noop,
  }

  if $yumrepo_name {
    create_resources ( yumrepo, hiera_hash('create_resources::yumrepo_name'), $defaults )
  }

}
