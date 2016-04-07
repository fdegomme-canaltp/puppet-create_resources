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
  $is_noop = $::clientnoop,
)  {

  class { '::create_resources::package': } ->
  class { '::create_resources::group': } ->
  class { '::create_resources::user': } ->
  Class['::create_resources']

}
