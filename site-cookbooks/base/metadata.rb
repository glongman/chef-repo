maintainer       "Overlay TV"
maintainer_email "dev@overlay.tv"
license          "All rights reserved"
description      "Installs/Configures base"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

depends "build-essential"
depends "subversion"
depends "git-core"
depends "checkinstall"

recipe "base", "base configuration"
