maintainer       "Overlay TV"
maintainer_email "dev@overlay.tv"
license          "All rights reserved"
description      "Installs/Configures ffmpeg"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

recipe "ffmpeg", "Main ffmpeg configuration"
recipe "ffmpeg::dependencies", "get/make and install ffmpeg dependencies, codecs, etc"

%w(ubuntu).each do |os|
  supports os
end

attribute "ffmpeg",
  :display_name => "ffmpeg Hash",
  :description => "Hash of ffmpeg attributes",
  :type => "hash"
  
