name 'apache2'
source_url 'https://github.com/sous-chefs/apache2'
issues_url 'https://github.com/sous-chefs/apache2/issues'
maintainer 'Sous Chefs'
maintainer_email 'help@sous-chefs.org'
chef_version '>= 12.1' if respond_to?(:chef_version)
license 'Apache-2.0'
description 'Installs and configures all aspects of apache2 using Debian style symlinks with helper definitions'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '3.3.1'

supports 'debian'
supports 'ubuntu'
supports 'redhat'
supports 'centos'
supports 'fedora'
supports 'amazon'
supports 'scientific'
supports 'freebsd'
supports 'suse'
supports 'opensuse'
supports 'opensuseleap'
supports 'arch'
