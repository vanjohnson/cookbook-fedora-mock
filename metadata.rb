name 'fedora-mock'
maintainer 'St. Isidore de Seville'
maintainer_email 'st.isidore.de.seville@gmail.com'
license 'MIT'
description 'Installs Fedora Mock'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

recipe 'fedora-mock::default', 'Installs Fedora Mock'

depends 'yum-epel'

supports 'redhat'
supports 'centos'
supports 'fedora'
