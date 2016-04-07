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

### What create_resources affects

* OS packages
* YUM repositoriess
* `/home/` directories and files.
* `/root/` directories and files.
* `/etc/passwd`
* `/etc/shadow`
* `/etc/group`

### Beginning with Create_resources

## Usage

To have Puppet manage YUM repositories, you have to declare the `create_resources::yumrepo_name` class:

``` puppet
class { 'create_resources::yumrepo': }
```

It is advised to run this class before all others.

To do that, make usage of [Puppet Run Stages](https://docs.puppetlabs.com/puppet/latest/reference/lang_run_stages.html) and declare the class the following way in your manifest:

``` puppet
## Run stages definition
stage { 'first': before => Stage['main'] }
stage { 'last': }
Stage['main'] -> Stage['last']
case $::osfamily {
  'RedHat': {
    class { '::create_resources::yumrepo': stage => first }
  }
}}
```

### Managing yumrepo resources

To have Puppet make sure that the [nginx CentOS YUM repository](https://www.nginx.com/resources/wiki/start/topics/tutorials/install/#official-red-hat-centos-packages) is configured, declare the following hiera hash:

``` yaml
create_resources::yumrepo::list:
  'nginx':
    descr: 'nginx repo'
    baseurl: 'http://nginx.org/packages/centos/$releasever/$basearch/'
    gpgcheck: 0
    enabled: 1
```

To have Puppet remove the [nginx CentOS YUM repository](https://www.nginx.com/resources/wiki/start/topics/tutorials/install/#official-red-hat-centos-packages) above, declare the following hiera hash:

``` yaml
create_resources::yumrepo::list:
  'nginx':
    ensure: absent
```

### Managing package resources

To have Puppet install `wget` OS package, declare the following hiera hash:

``` yaml
create_resources::package::list:
  'wget': {}
```

To have Puppet install latest `wget` OS package, declare the following hiera hash:

``` yaml
create_resources::package::list:
  'wget':
    ensure: latest
```

### Managing user and group resources

To have Puppet create the user `toto`, along with its group, declare the following hiera hashes:

``` yaml
user_group::group::list:
  'toto':
    ensure: present
    gid: 1002

user_group::user::list:
  'toto':
    ensure: present
    uid: 1002
    gid: 1002
    comment: 'Toto user_group'
    home: '/home/toto'
    managehome: true
    shell: '/bin/bash'
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
