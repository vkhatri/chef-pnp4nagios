name 'pnp4nagios'
maintainer 'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures pnp4nagios'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.1'

depends 'rrdtool'
depends 'apache2'

%w(amazon redhat centos fedora).each { |o| supports o }
