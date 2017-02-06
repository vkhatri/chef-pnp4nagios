name 'pnp4nagios'
maintainer 'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures pnp4nagios'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.9'
source_url 'https://github.com/vkhatri/chef-pnp4nagios' if respond_to?(:source_url)
issues_url 'https://github.com/vkhatri/chef-pnp4nagios/issues' if respond_to?(:issues_url)

depends 'rrdtool'
depends 'apache2'

%w(ubuntu amazon redhat centos fedora).each { |o| supports o }
