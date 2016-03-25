class create_resources::yumrepo (
  $yumrepo_list   = undef,
  $yumrepo_ensure = present,
  $is_noop        = $create_resources::is_noop,
) {

  $defaults = {
    ensure => $yumrepo_ensure,
    noop   => $is_noop,
  }

  notify { "yumrepo is called with ${yumrepo_list}": }

  if $yumrepo_list {
    create_resources ( yumrepo, hiera_hash('create_resources::yumrepo::yumrepo_list'), $defaults )
  }

}
