# create_resources

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with create_resources](#setup)
    * [What create_resources affects](#what-create_resources-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with create_resources](#beginning-with-create_resources)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module will let you manage Hiera hash for Puppet standard resource types.
This can be OS packages to install, etc...

## Setup

### What create_resources affects **OPTIONAL**

* OS packages
  impact, or execute.
* Dependencies that your module automatically installs.
* Warnings or other important notices.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you might want to include an additional "Upgrading" section
here.

## Usage

### Package resource

To have Puppet install `wget` OS package, declare the following hiera hash:

``` yaml
create_resources::packages_list:
  'wget': {}
```

To have Puppet install latest `wget` OS package, declare the following hiera hash:

``` yaml
create_resources::packages_list:
  'wget':
    ensure: latest
```

## Reference

Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se.

## Limitations

This module is limited by Puppet resources limitations only.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.
