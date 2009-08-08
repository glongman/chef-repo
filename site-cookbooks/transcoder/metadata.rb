maintainer       "Overlay TV"
maintainer_email "dev@overlay.tv"
license          "All rights reserved"
description      "Installs/Configures transcoder"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

depends 'base'
depends 'ffmpeg'

recipe 'transcoder', 'Everything you need'
recipe 'transcoder::gd2', 'gd2 library and gem'
recipe 'transcoder::gpac', 'gpac library, Mpeg-4 stuff'
recipe 'transcoder::rvideo', 'compatible rvideo gem'
# removed - non free recipe 'transcoder::neroAacEnc', 'encoder for ACC'