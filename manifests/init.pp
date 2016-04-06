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
  $package_list   = undef,
  $group_list     = undef,
  $user_list      = undef,
  $package_ensure = installed,
  $group_ensure   = present,
  $user_ensure    = present,
  $is_noop        = $::clientnoop,
)  {

  class { '::create_resources::package': } ->
  class { '::create_resources::group': } ->
  class { '::create_resources::user': } ->
  Class['::create_resources']

}
