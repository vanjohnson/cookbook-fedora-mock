name 'fedora-mock'
maintainer 'St. Isidore de Seville'
maintainer_email 'st.isidore.de.seville@gmail.com'
license 'MIT'
description 'Installs Fedora Mock'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

issues_url 'https://github.com/st-isidore-de-seville/cookbook-fedora-mock/issues'
source_url 'https://github.com/st-isidore-de-seville/cookbook-fedora-mock'

recipe 'fedora-mock::default', 'Installs Fedora Mock'

depends 'yum-epel', '~> 0.6.2'

supports 'redhat'
supports 'centos'
supports 'fedora'
