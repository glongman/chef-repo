#
# Cookbook Name:: ffmpeg
# Recipe:: dependencies
#
# Copyright 2009, Overlay TV
#
# All rights reserved - Do Not Redistribute
#

multiverse_repos = [
"deb http://us.archive.ubuntu.com/ubuntu/ intrepid multiverse",
"deb-src http://us.archive.ubuntu.com/ubuntu/ intrepid multiverse",
"deb http://us.archive.ubuntu.com/ubuntu/ intrepid-updates multiverse",
"deb-src http://us.archive.ubuntu.com/ubuntu/ intrepid-updates multiverse"]

# add them to sources, but not if they are already there.
multiverse_repos.each do |repo|
  execute "add-repo: #{repo}" do
     command %Q(sudo echo "#{repo}" >> /etc/apt/sources.list)
     not_if %Q(grep "#{repo}" /etc/apt/sources.list)
     action :run
  end
end

execute "update apt" do
  command "sudo apt-get update -y"
  action :run
end

packages = %w(yasm libgsm-tools texi2html libfaac-dev libfaad-dev libmp3lame-dev libsdl1.2-dev libtheora-dev libx11-dev libxvidcore4-dev zlib1g-dev libdirac-dev libschroedinger-dev libvorbis-dev)

packages.each do |p|
  package p do
    action :install
  end
end

# remove any existing tmp files
%w(/tmp/x264 /tmp/lame-3.97 /tmp/opencore-amr).each do |f|
  file f do
    ignore_failure true
    action :delete
  end
end

bash "install x264" do
  cwd '/tmp'
  code <<-EOH
    git clone git://git.videolan.org/x264.git 
    cd x264 
    ./configure 
    make 
    checkinstall --fstrans=no --install=yes --pkgname=x264 --pkgversion '1:0.svn`date +%Y%m%d`-0.0ubuntu1' --default
    ldconfig
    EOH
  action :run
end

bash "install lame" do
  cwd '/tmp'
  code <<-EOH
    tar xvf lame-3.97.tar.gz
    cd lame-3.97
    ./configure
    make
    checkinstall --fstrans=no --install=yes --pkgname=libmp3lame --pkgversion '1:0.svn`date +%Y%m%d`-0.0ubuntu1' --default 
    EOH
  action :nothing
end

remote_file "/tmp/lame-3.97.tar.gz" do
  source 'lame-3.97.tar.gz' # file in cookbook
  mode 0755
  owner 'root'
  group 'root'
  notifies :run, resources(:bash => 'install lame'), :immediately
end

bash 'install opencore-amr' do
  cwd '/tmp'
  code <<-EOH
    git clone git://opencore-amr.git.sourceforge.net/gitroot/opencore-amr
    cd opencore-amr
    ./configure
    make
    checkinstall --fstrans=no --install=yes --pkgname=opencore-amr --default
    ldconfig
    EOH
  action :run
end





