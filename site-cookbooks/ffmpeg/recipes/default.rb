#
# Cookbook Name:: ffmpeg
# Recipe:: default
#
# Copyright 2009, Overlay TV
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ffmpeg::dependencies"

bash "install ffmpeg" do
  cwd '/tmp'
  code <<-EOH
    svn checkout svn://svn.ffmpeg.org/ffmpeg/trunk ffmpeg 
    cd ffmpeg
    ./configure --enable-gpl \
        --enable-nonfree \
        --enable-pthreads \
        --enable-static \
        --enable-shared \
        --enable-libgsm \
        --enable-libfaac \
        --enable-libfaad \
        --enable-libfaadbin\
        --enable-libmp3lame \
        --enable-libtheora \
        --enable-libvorbis \
        --enable-postproc \
        --enable-libx264 \
        --enable-libxvid \
        --enable-x11grab \
        --enable-libopencore-amrnb \
        --enable-version3\
        --disable-devices\
        --disable-ffserver\
        --disable-ffplay\
        --disable-debug\
        --disable-network
    make
    checkinstall --fstrans=no --install=yes --pkgname=ffmpeg --pkgversion '3:0.svn`date +%Y%m%d`-12ubuntu3' --default
    ldconfig
    EOH
  action :run
end
