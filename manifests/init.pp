# Authors
# -------
#
# Author Name <ryayon@outlook.com>
#
# Copyright
# ---------
#
# Copyright 2016 Rudy YAYON.
#
class create_resources (
  $yumrepo_list   = undef,
  $package_list   = undef,
  $yumrepo_ensure = present,
  $package_ensure = installed,
  $is_noop        = $::clientnoop,
)  {

  class { '::create_resources::package': } ->
  Class['::create_resources']

}
