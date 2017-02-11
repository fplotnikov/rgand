name             'rgang'
maintainer       'Fedor'
maintainer_email 'fplotnikov at gmail.com'
license          'All rights reserved'
description      'Installs/Configures rgang'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apache2', '~> 3.2.2'
depends 'haproxy', '~> 3.0.1'
depends 'jenkins', '~> 4.2.1'
