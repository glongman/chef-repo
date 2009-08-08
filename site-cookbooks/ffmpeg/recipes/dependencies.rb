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

packages = %w(yasm texi2html libfaac-dev libfaad-dev libmp3lame-dev libsdl1.2-dev libtheora-dev libx11-dev libxvidcore4-dev zlib1g-dev libdirac-dev libschroedinger-dev libvorbis-dev)

packages.each do |p|
  package pkg do
    action :install
  end
end