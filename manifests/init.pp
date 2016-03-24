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
  $packages_list   = undef,
  $packages_ensure = installed,
  $is_noop         = $::clientnoop,
)  {

  class { '::create_resources::packages': } ->
  Class['::create_resources']

}
