#
# Cookbook Name:: ffmpeg
# Recipe:: default
#
# Copyright 2009, Overlay TV
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ffmpeg::dependencies"

# remove any existing tmp files
directory "/tmp/ffmpeg" do
  ignore_failure true
  recursive true
  action :delete
end


bash "install ffmpeg" do
  cwd '/tmp'
  code <<-EOH
    svn checkout -r 19601 svn://svn.ffmpeg.org/ffmpeg/trunk ffmpeg 
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
        --enable-version3 \
        --disable-devices \
        --disable-ffserver \
        --disable-ffplay \
        --disable-debug \
        --disable-iwmmxt \
        --disable-network \
        --extra-ldflags='-ldl'
    make
    checkinstall --fstrans=no --install=yes --pkgname=ffmpeg --pkgversion '3:0.svn`date +%Y%m%d`-12ubuntu3' --default
    ldconfig
    EOH
  action :run
end
