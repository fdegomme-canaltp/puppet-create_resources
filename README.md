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
* YUM repositories
* APT repositories
* `/home/` directories and files.
* `/root/` directories and files.
* `/etc/passwd`
* `/etc/shadow`
* `/etc/group`

### Beginning with Create_resources

## Usage

To have Puppet manage YUM repositories, you have to declare the `create_resources::yumrepo` class:

``` puppet
class { 'create_resources::yumrepo': }
```

The same way, to have Puppet manage APT repositories, you have to declare the `create_resources::apt::source` class:

``` puppet
class { 'create_resources::apt::source': }
```

It is advised to run these classes before all others.

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
  'Debian': {
    class { '::create_resources::apt::key': stage => first }
    class { '::create_resources::apt::source': stage => first }
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

### Managing apt::key resources

To have Puppet make sure that the [Puppetlabs GPG key](https://forge.puppet.com/puppetlabs/apt#add-gpg-keys) is installed, declare the following hiera hash:

``` yaml
create_resources::apt::key::list:
  'puppetlabs':
    id: '47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30'
    server: 'pgp.mit.edu'
    options: 'http-proxy="http://proxyuser:proxypass@example.org:3128"'
```

### Managing apt::source resources

To have Puppet make sure that the [Puppet 3.x jessie APT repository](https://docs.puppet.com/puppet/3.8/reference/install_debian_ubuntu.html) is configured, declare the following hiera hash:

``` yaml
create_resources::apt::source::list:
  'puppet':
    comment: 'puppet 3.x repo'
    location: 'http://apt.puppetlabs.com'
    repos: 'main dependencies devel'
    key:
      id: '47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30'
      server: 'pgp.mit.edu'
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
create_resources::group::list:
  'toto':
    ensure: present
    gid: 1002

create_resources::user::list:
  'toto':
    ensure: present
    uid: 1002
    gid: 1002
    comment: 'Toto user_group'
    home: '/home/toto'
    managehome: true
    shell: '/bin/bash'
```

### Managing elasticsearch::instance resources

To have Puppet manage elasticsearch instances:

- you have to declare the `create_resources::elasticsearch::instance` class:

``` puppet
class { 'create_resources::elasticsearch::instance': }
```

- you also need the [elasticsearch/elasticsearch](https://forge.puppet.com/elasticsearch/elasticsearch) module to use this functionality.

Then to have Puppet create a `es_01` elasticsearch instance, declare the following hiera hash:

``` yaml
create_resources::elasticsearch::instance::list:
  'es_01': {}
```

### Managing elasticsearch::plugin resources

To have Puppet manage elasticsearch plugins:

- you have to declare the `create_resources::elasticsearch::plugin` class:

``` puppet
class { 'create_resources::elasticsearch::plugin': }
```

- you also need the [elasticsearch/elasticsearch](https://forge.puppet.com/elasticsearch/elasticsearch) module to use this functionality.

Then to have Puppet install the [marvel](https://www.elastic.co/downloads/marvel) elasticsearch plugin, declare the following hiera hash:

``` yaml
create_resources::elasticsearch::plugin::list:
  'license':
    instances: <choose_a_name>
  'marvel-agent ':
    instances: <choose_a_name>
```

### Managing logstash::configfile resources

To have Puppet manage logstash configfiles:

- you have to declare the `create_resources::logstash::configfile` class:

``` puppet
class { 'create_resources::logstash::configfile': }
```

- you also need the [elasticsearch/logstash](https://forge.puppet.com/elasticsearch/logstash) module to use this functionality.

Then to have Puppet create a [`output_es` logstash configfile](https://forge.puppet.com/elasticsearch/logstash#logstash-config-files), declare the following hiera hash:

``` yaml
create_resources::logstash::configfile::list:
  'output_es':
    template: 'logstash/output_es_cluster.erb'
    order: 30
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
